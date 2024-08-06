from backend.dao import Dao
from backend.service import Service
import configparser

class AbstractFactory:
    @classmethod
    def create_dao(cls, config):
        raise NotImplementedError("create_dao method not implemented")
    
    @classmethod
    def create_service(cls, dao):
        raise NotImplementedError("create_service method not implemented")


class ConcreteFactory(AbstractFactory):
    @classmethod
    def create_dao(cls, config):
        return Dao(
            host=config['DATABASE']['host'],
            user=config['DATABASE']['user'],
            password=config['DATABASE']['password'],
            database=config['DATABASE']['database'],
        )
        
    @classmethod
    def create_service(cls, dao):
        return Service(dao)

def read_config(file_path):
    config = configparser.ConfigParser()
    config.read(file_path)
    return config

def initialize_system(config_path="/Users/ojaswichopra/Downloads/Projects/Sparklton/backend/config.ini"):
    config = read_config(config_path)
    factory = ConcreteFactory()

    dao = factory.create_dao(config)
    service = factory.create_service(dao)
    return dao, service