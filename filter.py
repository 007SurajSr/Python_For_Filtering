import pandas as pd 
df = pd.read_csv('orders.csv')

print(df)

m = df['Ship Mode'].unique()
print(m)

df = pd.read_csv('orders.csv',na_values=['Not Available','unknown'] )
n = df['Ship Mode'].unique()
print(n)

o = df.rename(columns={'Order Id':'order_id', 'City':'city'})
print (o)

p = df.columns.str.lower()
print (p)

q = df.columns.str.replace(' ', '_')
print(o)

df.columns = df.columns.str.replace(' ', '_')
print(df)

df['list_price'] * df['discount_percent'] * 0.01
df['discount'] = df['list_price'] * df['discount_percent'] * 0.01
print(df)

df['list_price']-df['cost_price']
df['sale_price'] = df['list_price']-df['discount']

df['profit'] = df['sale_price']-df['cost_price']

df.dtypes
df['order_date'] = pd.to_datetime(df['order_date'],format = "%Y-%m-%d")
df.dtypes

df.drop(columns=['list_price','cost_price', 'discount_percent'])
df.to_csv('output.csv', index=False)
import pandas as pd
from IPython.display import FileLink

# Save CSV
df.to_csv("output.csv", index=False)

# Creates a clickable download link in Jupyter
FileLink("output.csv")

