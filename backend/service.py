class Service:
    def __init__(self, dao):
        self.dao = dao

    def get_users(self):
        return self.dao.get_users()