'''
Creates module name for an elm file.
'''

import json
import os.path
import re

def file_exists(path, filename):
    file_path = os.path.join(path, filename)
    return os.path.isfile(file_path)

def get_package_file(path):
    if file_exists(path, 'elm.json'):
        return os.path.join(path, 'elm.json')
    if file_exists(path, 'elm-package.json'):
        return os.path.join(path, 'elm-package.json')
    raise FileNotFoundError('Could not find elm.json or elm-package.json files.')

def get_source_directory_paths(project_root):
    filename = get_package_file(project_root)
    with open(filename) as elm_package_json:
        data = json.load(elm_package_json)
        return data['source-directories']

def has_package_file(path):
    return file_exists(path, 'elm.json') or file_exists(path, 'elm-package.json')

def walk_dir_until(start, test):
    current = start
    while (current != '/'):
        if test(current):
            return current
        else:
            current = os.path.dirname(current)

def find_project_root(module_path):
    return walk_dir_until(module_path, has_package_file)

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

def build_orphan_module_name(module_path):
    filename = os.path.basename(module_path)
    return remove_elm_extension(filename)

def build_project_module_name(project_root, module_path):
    source_dirs = get_source_directory_paths(project_root)
    module_path_from_source = strip_source_directory(module_path, project_root, source_dirs)
    module_path_without_extension = remove_elm_extension(module_path_from_source)
    return convert_path_to_dot_separated(module_path_without_extension)

def convert_path_to_module_name(module_path):
    project_root = find_project_root(module_path)

    # If not in a project, fallback to using filename.
    if project_root == None:
        return build_orphan_module_name(module_path)

    return build_project_module_name(project_root, module_path)


