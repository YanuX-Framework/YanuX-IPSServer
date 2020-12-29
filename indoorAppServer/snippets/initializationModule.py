from ..snippets import decision_system, websockets, radiomap

from os import path
import joblib

def test_ws_communication():
    print('Testing ws communication with dummy data.')
    uuid = '000000'
    position_dict = {'Regression': (1.0, 1.0), 'Classification': 'Personal'}
    websockets.publish('INIT', uuid, position_dict)

def create_and_assert_fuzzy_system():
    save_file = 'save/fuzzy_dict.sav'
    if path.exists(save_file):
        fuzzy_dict = joblib.load(save_file)
        print('Fuzzy System loaded.')
        return fuzzy_dict
    else: 
        fuzzy_dict = decision_system.create_fuzzy_system()
        fuzzy_system = fuzzy_dict['System']
        fuzzy_technique = fuzzy_dict['Technique MF']
        print('Fuzzy System created.')
        decision_system.test_phase(fuzzy_system, fuzzy_technique)
        print('Fuzzy System successfully tested.')
        joblib.dump(fuzzy_dict, save_file)
        return fuzzy_dict

def train_existent_radio_maps():
    save_file = 'save/trained_rm.sav'
    if path.exists(save_file):
        print('Loading radio maps...')
        trained_rm = joblib.load(save_file)
        print('Radio maps successfully loaded.')
        return trained_rm
    else:
        print('Training radio maps...')
        trained_rm =  radiomap.train_each_radio_map()
        print('Radio maps successfully trained.')
        joblib.dump(trained_rm, save_file)
        return trained_rm
