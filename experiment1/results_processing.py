import os
import json
import matplotlib.pyplot as plt
import pandas as pd

def get_stats_json_paths(results_folder, sub_folder="test"):
  data_with_folder_info = []
  for folder in os.listdir(results_folder):
    # Split folder name
    folder_parts = folder.split("-")
    
    # Check if folder name has at least two parts
    if len(folder_parts) >= 2:
      # Construct path to directory 0 and val subdirectory
      dir_0_path = os.path.join(results_folder, folder)
      val_path = os.path.join(dir_0_path, "0", sub_folder)
      
      # Check if val directory exists
      if os.path.isdir(val_path):
        # Construct path to stats.json
        stats_json_path = os.path.join(val_path, "stats.json")
        
        try:
          # Open and load stats.json
          file_data = []
          with open(stats_json_path, "r") as f:
                
                for line in f:
                    file_data.append(json.loads(line))
          
          # Create dictionary with data and folder parts
          data_with_folder_info.append({
              "data": file_data,
              "folder_parts": folder_parts
          })
        except FileNotFoundError:
          # Handle case where stats.json is missing
          print(f"stats.json not found for folder: {folder}")
  
  return data_with_folder_info


def find_min_train_time(results_folder):
    stats = get_stats_json_paths(results_folder, "train")
    min_time = float('inf')
    for stat in stats:
        total_time = 0
        lines = stat['data']
        for line in lines:
            total_time += line['time_epoch']
        if total_time < min_time:
            min_time = total_time

    return total_time

def find_best_stat(stats_results):
    best_stats = []
    
    for stat in stats_results:
        total_time = 0
        lines = stat['data']
        model_name = stat['folder_parts'][-1]
        params = lines[0]['params']
        with_vn = stat['folder_parts'][0] == 'VN'
        data_set_name = stat['folder_parts'][-3] + '-' + stat['folder_parts'][-2]
        measurement = ''
        if data_set_name == "peptides-struct": 
            measurement = 'mae' 
        else: 
            measurement = 'ap'
        best_stat = None
        for line in lines:
            if data_set_name == "peptides-struct":
                current_measure = line[measurement]
                if not best_stat or current_measure < best_stat:
                    best_stat = current_measure
            else:
                current_measure = line[measurement]
                if not best_stat or current_measure > best_stat:
                    best_stat = current_measure

        best_stats.append({'model': model_name, 'params': params, 'measure': measurement, 'vn': with_vn, 'dataset': data_set_name, 'stat': best_stat})

    return best_stats


def generate_table(data_set_name, stats) -> pd.DataFrame:
    data = [d for d in stats if d['dataset'] == data_set_name]
    
    # Separate data by vn (with vn and without vn)
    vn_data = [d for d in data if d['vn']]
    no_vn_data = [d for d in data if not d['vn']]

    measure = vn_data[0]['measure']
    if measure == "mae":
        measure += '↓'
    else:
        measure += '↑'
    
    # Extract models and stats
    models = set([(d['model'], d['params']) for d in data])
    vn_stats = [(d['model'], d['stat']) for d in vn_data]
    no_vn_stats = [(d['model'], d['stat']) for d in no_vn_data]
    
    models = sorted(models, key=lambda x: x[0])
    vn_stats = sorted(vn_stats, key=lambda x: x[0])
    no_vn_stats = sorted(no_vn_stats, key=lambda x: x[0])
    
    return pd.DataFrame({
        'Model & Parameters': [x[0] + ' #' + str(round(x[1]/1000)) + 'K' for x in models],
        measure + ' (before VN)': [x[1] for x in no_vn_stats], 
        measure + ' (after VN)': [x[1] for x in vn_stats] + [None] * (len(no_vn_stats) - len(vn_stats))
    })
