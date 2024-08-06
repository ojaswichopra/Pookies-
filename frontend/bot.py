import sys
sys.path.append('/Users/ojaswichopra/Downloads/Projects/Sparklton/')

from backend.configuration import initialize_system
service= initialize_system()[1]

print(service.get_users())

