.. code:: ipython3

    !pip install mysql-connector-python


.. parsed-literal::

    Requirement already satisfied: mysql-connector-python in c:\users\pc\appdata\local\packages\pythonsoftwarefoundation.python.3.11_qbz5n2kfra8p0\localcache\local-packages\python311\site-packages (8.1.0)
    Requirement already satisfied: protobuf<=4.21.12,>=4.21.1 in c:\users\pc\appdata\local\packages\pythonsoftwarefoundation.python.3.11_qbz5n2kfra8p0\localcache\local-packages\python311\site-packages (from mysql-connector-python) (4.21.12)
    

.. parsed-literal::

    
    [notice] A new release of pip is available: 23.1.2 -> 23.2.1
    [notice] To update, run: C:\Users\pc\AppData\Local\Microsoft\WindowsApps\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\python.exe -m pip install --upgrade pip
    

.. code:: ipython3

    import mysql.connector as connector

.. code:: ipython3

    connection = connector.connect(user = "root", password = "doli10", db = "mydb")

.. code:: ipython3

    cursor = connection.cursor()

.. code:: ipython3

    try:
        show_tables_query = "SHOW TABLES"
        cursor.execute(show_tables_query)
        
        results = cursor.fetchall()
        
        print(results)
    
        cursor.close()
    
    except connector.Error as e:
        print("Error:", e)


.. parsed-literal::

    [('bookings',), ('customers',), ('menu',), ('menuitems',), ('orderdeliverystatus',), ('orders',), ('ordersview',), ('staff',)]
    

.. code:: ipython3

    connection = connector.connect(user = "root", password = "doli10", db = "mydb")

.. code:: ipython3

    cursor = connection.cursor()

.. code:: ipython3

    try:
        query = """
        SELECT Customers.CustomerName, Customers.CustomerNumber, Customers.CustomerEmail, Orders.TotalCost
        FROM Customers
        INNER JOIN Bookings ON Customers.CustomerID = Bookings.CustomerID
        INNER JOIN Orders ON Bookings.BookingID = Orders.BookingID
        WHERE Orders.TotalCost > 60
        """
        
        cursor.execute(query)
       
        results = cursor.fetchall()
        for row in results:
            print(row)
    
    except connector.Error as e:
        print("Error:", e)
    
    finally:
        cursor.close()
        connection.close()


.. parsed-literal::

    ('Kevin McAllister', 856365120, 'kev@email.com', Decimal('90'))
    

