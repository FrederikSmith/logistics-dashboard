# Logistics Delay Analysis
# This script analyses late delivery rates by shipping mode
# and visualises the results as a bar chart

import pandas as pd
import matplotlib.pyplot as plt

# Load the clean dataset
df = pd.read_csv('Data/Clean/logistics_clean.csv')

# Calculate late delivery rate by shipping mode using delivery status
shipping_analysis = df.groupby('Shipping_Mode').agg(
    Total_Orders=('Delivery_Status', 'count'),
    Late_Orders=('Delivery_Status', lambda x: (x == 'Late delivery').sum())
).reset_index()

shipping_analysis['Late_Delivery_Rate'] = round(
    shipping_analysis['Late_Orders'] * 100 / shipping_analysis['Total_Orders'], 2
)

shipping_analysis = shipping_analysis.sort_values('Late_Delivery_Rate', ascending=False)

# Print results to console
print("Late Delivery Rate by Shipping Mode:")
print(shipping_analysis[['Shipping_Mode', 'Total_Orders', 'Late_Orders', 'Late_Delivery_Rate']])

# Create bar chart
plt.figure(figsize=(10, 6))
plt.bar(
    shipping_analysis['Shipping_Mode'],
    shipping_analysis['Late_Delivery_Rate'],
    color=['#d9534f', '#e08e3c', '#f0ad4e', '#5cb85c']
)
plt.title('Late Delivery Rate by Shipping Mode', fontsize=14)
plt.xlabel('Shipping Mode')
plt.ylabel('Late Delivery Rate (%)')
plt.ylim(0, 100)
plt.axhline(y=54, color='black', linestyle='--', label='Overall Average (54%)')
plt.legend()
plt.tight_layout()
plt.savefig('Python/late_delivery_by_shipping_mode.png')
plt.show()

print("Chart saved to Python folder")