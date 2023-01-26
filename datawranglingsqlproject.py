#import needed component

# import component to access sqlite database
import sqlite3
import matplotlib.pyplot as plt
from matplotlib import gridspec
import numpy as np

def showordercustomermonthly():
    ########################################################################################################
    # This code to analyze monthly number of order and total value of order in relation with customer addition
    # from jan 2017 until august 201808.
    ########################################################################################################

    try:
        # define necesarry color that will be used
        backgroundcolor = '#FFFFFF'

        #connect to database
        sql_Connection = sqlite3.connect("olist.db")

        #creat cursor to execute query
        sql_Cursor = sql_Connection.cursor()
        #define query to get order monthly and execute
        sql_query = "select * from v_order_monthly"
        sql_Cursor.execute(sql_query)

        #fetch all data and put it into list
        result = sql_Cursor.fetchall
        YearMonth = []
        NumberofOrders = []
        ValueofOrders = []
        for i in sql_Cursor:
            YearMonth.append(i[1]+'-'+i[0])
            NumberofOrders.append(i[2])
            ValueofOrders.append(i[3]/1000) #scale for total value of order in thousand USD, so need to be divided by 1000

        #define query to get new customer addition and execute
        sql_query = "select * from v_new_customer_addition"
        sql_Cursor.execute(sql_query)

        #fetch all data and put it into list
        result = sql_Cursor.fetchall
        CustomerAddition = []
        for i in sql_Cursor:
            CustomerAddition.append(i[2])

        # start draw graph for monthly  number and total value order
        fig = plt.figure(num = 'Pacmann: Data Wrangling & SQL', facecolor = backgroundcolor)
        ax1 = fig.add_subplot()

        # draw graph for monthly number of order and customer addition
        ax1.plot(YearMonth, NumberofOrders, color = '#FFB100', marker = '*' )
        ax1.plot(YearMonth, CustomerAddition, color = '#85586F', marker = 'o' )
        ax1.set_xticks(ax1.get_xticks())
        ax1.set_xticklabels(YearMonth, rotation=45)
        ax1.set_ylim(0, 9000)
        ax1.set_ylabel("Number of Order\nCustomer Addition", color='#C58940', fontsize=14)
        ax1.tick_params(axis="y", labelcolor='#C58940')
        ax1.legend(['Number of order','Customer addition'], loc="upper left", frameon=False, labelcolor='#C58940')
        ax1.set_facecolor(backgroundcolor)

        # draw second graph for monthly total value of order with different y axis
        ax2 = ax1.twinx()
        ax2.plot(YearMonth, ValueofOrders, color = '#5BC0F8', marker = 's' )
        ax2.set_ylabel("Value of Order (in thousand $)", color='#5BC0F8', fontsize=14)
        ax2.tick_params(axis="y", labelcolor='#5BC0F8')
        ax2.set_ylim(0, 1100)
        ax2.legend(['Value of Order'], loc="upper right",  frameon=False,  labelcolor='#5BC0F8')

        # set graph title and show the graph
        plt.title("Customer Addition - Number and Value of Order Monthly",  fontsize=20, fontweight='bold', color='#61876E')
        plt.show()

    except sqlite3.Error as error:
        # if there was error when connect database or execute query
        print("Error with error message: ", error)
    finally:
        # if database connection open, close the Connection
        if sql_Connection:
            sql_Connection.close()

def showtotenordercategory():
    ########################################################################################################
    # This code to analyze top ten category order both from number and value in olist
    # from jan 2017 until august 201808.
    ########################################################################################################

    try:
        # define necesarry color that will be used
        backgroundcolor = '#FFFFFF'

        #connect to database
        sql_Connection = sqlite3.connect("olist.db")

        #creat cursor to execute query
        sql_Cursor = sql_Connection.cursor()
        #define query and execute
        sql_query = "select * from v_top_ten_product_category_by_number_of_order Order by NumberofOrder"
        sql_Cursor.execute(sql_query)

        #fetch all data for v_top_ten_product_category_by_number_of_order and put it into list
        result = sql_Cursor.fetchall
        Categories1 = []
        NumberofOrders = []
        for i in sql_Cursor:
            Categories1.append(i[0])
            NumberofOrders.append(i[1])

        #define query and execute
        sql_query = "select * from v_top_ten_product_category_by_value_of_order order by ValueofOrder"
        sql_Cursor.execute(sql_query)

        #fetch all data for v_top_ten_product_category_by_value_of_order and put it into list
        result = sql_Cursor.fetchall
        Categories2 = []
        ValueofOrders = []
        for i in sql_Cursor:
            Categories2.append(i[0])
            ValueofOrders.append(i[1]/1000)

        # start drawing graph by define grid into 2 coloumn and 1 row
        fig = plt.figure(num = 'Pacmann: Data Wrangling & SQL', facecolor = backgroundcolor)
        spec = gridspec.GridSpec(ncols=2, nrows=1, wspace=0.5, hspace=0.5)

        # start drawing graph for top ten product category by number of order
        ax0 = fig.add_subplot(spec[0])
        ax0.tick_params(axis="y", labelcolor='#FFB100')
        ax0.set_xlabel("Number of Order", color='#FFB100', fontsize=14)
        ax0.set_facecolor(backgroundcolor)
        ax0.barh(Categories1, NumberofOrders, color = '#FFB100' )

        # start drawing graph for top ten product category by value of order
        ax1 = fig.add_subplot(spec[1])
        ax1.tick_params(axis="y", labelcolor='#5BC0F8')
        ax1.set_xlabel("Value of Order (in thousand $)", color='#5BC0F8', fontsize=14)
        ax1.set_facecolor(backgroundcolor)
        ax1.barh(Categories2,ValueofOrders, color = '#5BC0F8')

        # set graph title and show the graph
        plt.suptitle('Top ten order by category',  fontsize=20, fontweight='bold', color='#61876E')
        plt.show()

    except sqlite3.Error as error:
        # if there was error when connect database or execute query
        print("Error with error message: ", error)
    finally:
        # if database connection open, close the Connection
        if sql_Connection:
            sql_Connection.close()

def showordercustomerbystate():
    ########################################################################################################
    # This code to analyze customer order by state both from number and value of order
    # from jan 2017 until august 201808.
    ########################################################################################################
    try:
        # define color that will be used
        backgroundcolor = '#FFFFFF'

        #connect to database
        sql_Connection = sqlite3.connect("olist.db")

        #creat cursor to execute query
        sql_Cursor = sql_Connection.cursor()
        #define query and execute
        sql_query = "select * from v_customer_order_number_by_state"
        sql_Cursor.execute(sql_query)

        #fetch all data for v_customer_order_number_by_state and put it into list
        result = sql_Cursor.fetchall
        State1 = []
        NumberofOrders = []
        for i in sql_Cursor:
            State1.append(i[0])
            NumberofOrders.append(i[1])

        #define query and execute
        sql_query = "select * from v_customer_order_value_by_state"
        sql_Cursor.execute(sql_query)

        #fetch all data for v_customer_order_value_by_state and put it into list
        result = sql_Cursor.fetchall
        State2 = []
        ValueofOrders = []
        for i in sql_Cursor:
            State2.append(i[0])
            ValueofOrders.append(i[1]/1000)

        # start drawing graph by define grid into 1 coloumn and 2 row
        fig = plt.figure(num = 'Pacmann: Data Wrangling & SQL', facecolor = backgroundcolor)
        spec = gridspec.GridSpec(ncols=1, nrows=2, wspace=0.5, hspace=0.5)

        # start drawing graph for customer order by state based on number of order
        ax0 = fig.add_subplot(spec[0])
        ax0.tick_params(axis="y", labelcolor='#FFB100')
        ax0.set_xlabel("Number of Order", color='#FFB100', fontsize=14)
        ax0.set_facecolor(backgroundcolor)
        ax0.bar(State1, NumberofOrders, color = '#FFB100' )

        # start drawing graph for customer order by state based on value of order
        ax1 = fig.add_subplot(spec[1])
        ax1.tick_params(axis="y", labelcolor='#5BC0F8')
        ax1.set_xlabel("Value of Order (in thousand $)", color='#5BC0F8', fontsize=14)
        ax1.set_facecolor(backgroundcolor)
        ax1.bar( State2, ValueofOrders, color = '#5BC0F8')

        # set graph title and show the graph
        plt.suptitle('Customer order by state',  fontsize=20, fontweight='bold', color='#61876E')
        plt.show()

    except sqlite3.Error as error:
        # if there was error when connect database or execute query
        print("Error with error message: ", error)
    finally:
        # if database connection open, close the Connection
        if sql_Connection:
            sql_Connection.close()

def showorderpaymenttypeyearly():
    ########################################################################################################
    # This code to analyze order payment type yearly
    ########################################################################################################
    try:
        # define color that will be used
        backgroundcolor = '#FFFFFF'
        PieColors = ['#0081C9','#FC7300','#1F8A70','#BFDB38']

        #connect to database
        sql_Connection = sqlite3.connect("olist.db")

        #creat cursor to execute query
        sql_Cursor = sql_Connection.cursor()
        #define query and execute
        sql_query = "select * from v_payment_type_yearly"
        sql_Cursor.execute(sql_query)

        #fetch all data for v_top_ten_product_category_by_number_of_order and put it into list
        result = sql_Cursor.fetchall
        Paymenttypes = []
        Orders2017 = []
        Orders2018 = []
        for i in sql_Cursor:
            Paymenttypes.append(i[0])
            Orders2017.append(i[1])
            Orders2018.append(i[2])

        # start drawing graph by define grid into 2 coloumn and 1 row
        fig = plt.figure(num = 'Pacmann: Data Wrangling & SQL',facecolor=backgroundcolor)
        spec = gridspec.GridSpec(ncols=2, nrows=1, wspace=0.5, hspace=0.5)

        # start drawing graph for top ten product category by number of order
        ax0 = fig.add_subplot(spec[0])
        ax0.set_facecolor(backgroundcolor)
        ax0.set_title('2017', fontsize=14)
        wedges, texts, autotexts = ax0.pie(Orders2017, labels=None, autopct='%.1f%%', colors=PieColors)
        ax0.legend(wedges, Paymenttypes, title="Payment type", loc="center left", bbox_to_anchor=(1.1, 0, 0.5, 1),  frameon=False )

        # start drawing graph for top ten product category by value of order
        ax1 = fig.add_subplot(spec[1])
        ax1.set_facecolor(backgroundcolor)
        ax1.set_title('2018', fontsize=14)
        ax1.pie(Orders2018, labels=None, autopct='%.1f%%', colors=PieColors)

        # set graph title and show the graph
        plt.suptitle('Order yearly by payment type ',  fontsize=20, fontweight='bold', color='#61876E')
        plt.show()

    except sqlite3.Error as error:
        # if there was error when connect database or execute query
        print("Error with error message: ", error)
    finally:
        # if database connection open, close the Connection
        if sql_Connection:
            sql_Connection.close()

def showordercustimerreview():
    ########################################################################################################
    # This code to look for relation between customer review, on time delivery and repeat order
    ########################################################################################################
    try:

        # define necesarry color that will be used
        customerreviewcolor = ['#E14D2A','#A2B5BB','#A4BE7B','#68B984','#1F8A70']
        repeatordercolor = ['#A555EC','#D09CFA']
        ontimedeliverycolor = ['#D36B00','#FFD39A']
        backgroundcolor = '#FFFFFF'

        #connect to database
        sql_Connection = sqlite3.connect("olist.db")

        #creat cursor to execute query
        sql_Cursor = sql_Connection.cursor()

        #define query to get customer review data and execute
        sql_query = "select * from v_customer_review_statistic"
        sql_Cursor.execute(sql_query)

        #fetch all data for v_top_ten_product_category_by_number_of_order and put it into list
        result = sql_Cursor.fetchall
        Satisfactions = []
        NumberofCustomer = []

        for i in sql_Cursor:
            Satisfactions.append(i[0])
            NumberofCustomer.append(i[1])

        #define query to get repeat order data and execute
        sql_query = "select * from v_repeat_order_statistic"
        sql_Cursor.execute(sql_query)

        #fetch all data for v_repeat_order_statistic and put it into list
        result = sql_Cursor.fetchall
        notesrepeatorder = ['Repeat Order','No Repeat Order']
        repeatorder = []
        for i in sql_Cursor:
            repeatorder.append(i[0])
            repeatorder.append(i[1])

        #define query to get ontime delivery data and execute
        sql_query = "select * from v_ontime_delivery_statistic"
        sql_Cursor.execute(sql_query)

        #fetch all data for v_ontime_delivery_statistic and put it into list
        result = sql_Cursor.fetchall
        notesdelivery = ['Ontime Delivery','Late Delivery']
        ontimedelivery = []
        for i in sql_Cursor:
            ontimedelivery.append(i[0])
            ontimedelivery.append(i[1])

        # set background color
        fig = plt.figure(num = 'Pacmann: Data Wrangling & SQL',facecolor=backgroundcolor)

        #define grid to set the layout
        spec = gridspec.GridSpec(ncols=2, nrows=5)

        # start drawing graph for customer review
        ax0 = fig.add_subplot(spec[:3, :2])
        wedges, texts, autotexts = ax0.pie(NumberofCustomer, labels=None, autopct='%.1f%%', pctdistance=0.7, colors=customerreviewcolor, wedgeprops=dict(width=0.5), startangle=-60)
        bbox_props = dict(boxstyle="square,pad=0.3", fc="w", ec="k", lw=0.72)
        kw = dict(arrowprops=dict(arrowstyle="-"),
                  bbox=bbox_props, zorder=0, va="center")

        # create label for customer review
        for i, p in enumerate(wedges):
            ang = (p.theta2 - p.theta1)/2. + p.theta1
            y = np.sin(np.deg2rad(ang))
            x = np.cos(np.deg2rad(ang))
            horizontalalignment = {-1: "right", 1: "left"}[int(np.sign(x))]
            connectionstyle = "angle,angleA=0,angleB={}".format(ang)
            kw["arrowprops"].update({"connectionstyle": connectionstyle})
            ax0.annotate(Satisfactions[i], xy=(x, y), xytext=(1.35*np.sign(x), 1.4*y),
                        horizontalalignment=horizontalalignment, **kw)

        # create title for customer review
        ax0.set_title("Customer Review", color='#A4BE7B', fontsize=14)

        # start drawing graph for repeat order statistic
        ax1 = fig.add_subplot(spec[-2:, :1])
        wedges, texts, autotexts = ax1.pie(repeatorder, labels=None, autopct='%.1f%%', pctdistance=0.7, colors=repeatordercolor, wedgeprops=dict(width=0.5), startangle=-60)
        bbox_props = dict(boxstyle="square,pad=0.3", fc="w", ec="k", lw=0.72)
        kw = dict(arrowprops=dict(arrowstyle="-"),
                  bbox=bbox_props, zorder=0, va="center")

        # create label for repeat order statistic
        for i, p in enumerate(wedges):
            ang = (p.theta2 - p.theta1)/2. + p.theta1
            y = np.sin(np.deg2rad(ang))
            x = np.cos(np.deg2rad(ang))
            horizontalalignment = {-1: "right", 1: "left"}[int(np.sign(x))]
            connectionstyle = "angle,angleA=0,angleB={}".format(ang)
            kw["arrowprops"].update({"connectionstyle": connectionstyle})
            ax1.annotate(notesrepeatorder[i], xy=(x, y), xytext=(1.35*np.sign(x), 1.4*y),
                        horizontalalignment=horizontalalignment, **kw)

        # create title for repeat order statistic
        ax1.set_title("Repeat Order", color='#D09CFA', fontsize=14)

        # start drawing graph for delivery statistic
        ax2 = fig.add_subplot(spec[-2:, 1:])
        wedges, texts, autotexts = ax2.pie(ontimedelivery, labels=None, autopct='%.1f%%', pctdistance=0.7, colors=ontimedeliverycolor, wedgeprops=dict(width=0.5), startangle=60)
        bbox_props = dict(boxstyle="square,pad=0.3", fc="w", ec="k", lw=0.72)
        kw = dict(arrowprops=dict(arrowstyle="-"),
                  bbox=bbox_props, zorder=0, va="center")

        # create label for delivery statistic
        for i, p in enumerate(wedges):
            ang = (p.theta2 - p.theta1)/2. + p.theta1
            y = np.sin(np.deg2rad(ang))
            x = np.cos(np.deg2rad(ang))
            horizontalalignment = {-1: "right", 1: "left"}[int(np.sign(x))]
            connectionstyle = "angle,angleA=0,angleB={}".format(ang)
            kw["arrowprops"].update({"connectionstyle": connectionstyle})
            ax2.annotate(notesdelivery[i], xy=(x, y), xytext=(1.35*np.sign(x), 1.4*y),
                        horizontalalignment=horizontalalignment, **kw)
        # create title for delivery statistic
        ax2.set_title("Ontime Delivery", color='#D36B00', fontsize=14)

        # set graph title and show the graph
        plt.suptitle('Statistic of customer review - ontime delivery - repeat order', fontsize=20, fontweight='bold', color='#61876E')
        plt.show()
    except sqlite3.Error as error:
        # if there was error when connect database or execute query
        print("Error with error message: ", error)
    finally:
        # if database connection open, close the Connection
        if sql_Connection:
            sql_Connection.close()

# initialize variable for looping
whatever = True

while whatever == True:

    print("""
        1-Customer Order Monthly
        2-Top Ten Order Category
        3-Order Customer by State
        4-Order Payment Type Yearly
        5-Order Customer Review
        6-Exit
    """)

    choice = input("Choice: ")
    print("Processing .......")
    if choice == "1":
        showordercustomermonthly()
    elif choice == "2":
        showtotenordercategory()
    elif choice == "3":
        showordercustomerbystate()
    elif choice == "4":
        showorderpaymenttypeyearly()
    elif choice == "5":
        showordercustimerreview()
    elif choice == "6":
         whatever = False
    else:
        print("... Choose 1,2,3,4,5 or 6")
