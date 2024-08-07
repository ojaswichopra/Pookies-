class Service:
    def __init__(self, dao):
        self.dao = dao

    def get_users(self):
        return self.dao.get_users()
    
    def get_orders(self,status,uid):
        return self.dao.get_orders(status,uid)
    
    def get_order_items(self,orderID):
        return self.dao.get_order_items(orderID)
    
    def get_product_from_order(self,productID):
        return self.dao.get_product_from_order(productID)
    
    def get_faqs(self,category):
        return self.dao.get_faqs(category)
    
    def raise_tickets(self,uid,desc):
        return self.dao.raise_tickets(self,uid,desc)
    

