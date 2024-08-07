import mysql.connector
from datetime import datetime

class Dao:
    '''This class definition, Dao, is a data access object for the Walmart database. 
    It establishes a connection to the database and provides methods for executing various 
    queries related to company data.'''

    def __init__(self, host, user, password, database):
        """
        Initializes a new instance of the class.

        Args:
            host (str): The host of the MySQL server.
            user (str): The username to connect to the MySQL server.
            password (str): The password to authenticate the user.
            database (str): The name of the database to connect to.

        Returns:
            None
        """
        self.connection = mysql.connector.connect(
            host=host,
            user=user,
            password=password,
            database=database,
        )

    def execute_query(self, query, params=None):
        """
        Executes a SQL query using the provided query and parameters and returns the result set.

        Parameters:
            query (str): The SQL query to be executed.
            params (dict, optional): The parameters to be used in the query. Default is None.

        Returns:
            list: A list containing the result set of the query.

        Raises:
            mysql.connector.Error: If an error occurs while executing the query.
        """
        
        with self.connection.cursor() as cursor:
            cursor.execute(query, params=params)
            return cursor.fetchall()

    def get_users(self):
        query = "SELECT * FROM USER;"
        results = self.execute_query(query)
        return results
    
    def get_orders(self,status,uid):
        if status=='All':
            query = f"SELECT * FROM OrderHistory WHERE UserID={uid};"
        else:
            query = f"SELECT * FROM OrderHistory WHERE UserID={uid} AND OrderStatus={status};"
        results = self.execute_query(query)
        return results
    
    def get_order_items(self,orderID):
        query = f"SELECT * FROM OrderItems WHERE OrderID={orderID};"
        results = self.execute_query(query)
        return results
    
    def get_product_from_order(self,productID):
        query = f"SELECT * FROM Product WHERE ProductID={productID};"
        results = self.execute_query(query)
        return results
    
    def get_faqs(self,category):
        query = f"SELECT * FROM FAQs WHERE Category={category};"
        results = self.execute_query(query)
        return results

    def raise_tickets(self,uid,desc):
        now = datetime.now()
        now = now.strftime('%Y-%m-%d %H:%M:%S')
        query = f"INSERT INTO CustomerSupportTickets (UserID, IssueDescription, Status, CreatedDate) VALUES ({uid}, {desc}, 'In Progress', {now});"
        self.execute_query(query)
        
        
        
