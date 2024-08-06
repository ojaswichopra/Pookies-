import sys
sys.path.append('/Users/ojaswichopra/Downloads/Projects/Sparklton/')
import pandas as pd
from backend.configuration import initialize_system
service= initialize_system()[1]

# print(service.get_users())

uid=1

data = service.get_product_from_order(1)
print(pd.DataFrame(data))