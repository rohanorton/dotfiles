'''
Creates module name for an elm file.
'''

import json
import os.path
import re

def get_source_directory_paths(root_path):
    filename = os.path.join(root_path, 'elm-package.json')
    with open(filename) as elm_package_json:
        data = json.load(elm_package_json)
        return data['source-directories']

def find_root_directory(module_path):
    current_path = module_path
    while (current_path != '/'):
        elm_package_json = os.path.join(current_path, 'elm-package.json')
        if os.path.isfile(elm_package_json):
            return current_path
        else:
            current_path = os.path.dirname(current_path)
    return '.'

def remove_elm_extension(file_path):
    if file_path.endswith('.elm'):
        return file_path[:-4]
    else:
        return file_path

def convert_path_to_dot_separated(string):
    slashless = re.sub(r'/', '.', string)
    leading_dotless = re.sub(r'^\.', '', slashless)
    return leading_dotless

def strip_source_directory(module_path, root_path, source_dirs):
    for source_dir in source_dirs:
        abs_source_dir = os.path.join(root_path, source_dir)
        index = module_path.find(abs_source_dir)
        if index == 0:
            length = len(abs_source_dir)
            return module_path[length:]
    # If this fails, just return the filename.
    return os.path.basename(module_path)


def convert_path_to_module_name(module_path):
    root_path = find_root_directory(module_path)

    try:
        source_dirs = get_source_directory_paths(root_path)
    except:
        source_dirs = []

    module_path_from_source = strip_source_directory(module_path, root_path, source_dirs)
    module_path_without_extension = remove_elm_extension(module_path_from_source)
    module_name = convert_path_to_dot_separated(module_path_without_extension)
    return module_name


