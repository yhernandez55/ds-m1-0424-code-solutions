# -*- coding: utf-8 -*-
"""visualization-project-laptop-defects.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1luR1EyBWfxAuTP79aon700eziKW2caQX
"""

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

file_path = '/content/Data_Analysis_Project.xlsx'
df = pd.read_excel(file_path, sheet_name='Data')
df

# 1
df['Month ID(YYYYMM)'] = pd.to_datetime(df['Month ID(YYYYMM)'].astype(str), format='%Y%m')

# Set the datetime column as the index
df.set_index('Month ID(YYYYMM)', inplace=True)

# Plot the data
plt.figure(figsize=(10, 6))
plt.plot(df.index, df['Defects'], marker='o')

# Format the x-axis to show month abbreviations
plt.gca().xaxis.set_major_formatter(plt.matplotlib.dates.DateFormatter('%b %Y'))

plt.title('Defects Over Time')
plt.xlabel('Month')
plt.ylabel('Defects')
plt.grid(True)
plt.show()

# 2
plt.figure(figsize=(10, 6))
plt.plot(df.index, df['Opportunities'], marker='o')

# Format the x-axis to show month abbreviations
plt.gca().xaxis.set_major_formatter(plt.matplotlib.dates.DateFormatter('%b %Y'))

plt.title('Opportunities Over Time')
plt.xlabel('Month')
plt.ylabel('Opportunities')
plt.grid(True)
plt.show()

# 3

defect_rate = df['Defects']/df['Opportunities']
mean_defect_rate = defect_rate.mean()
limit_2std = df['2 Sigma limit']/1000000
limit_3std = df['3 Sigma limit']/1000000
std_defect_rate = defect_rate.std()

plt.figure(figsize=(10, 6))
plt.plot(df.index, defect_rate, marker='o', linestyle='-', color='r', label='Defect Rate')
plt.axhline(y=mean_defect_rate, color='blue', linestyle='--', label='Mean Defect Rate')
plt.axhline(y=limit_2std[0], color='orange', linestyle='--', label='UCL (Mean + 2σ)')
plt.axhline(y=limit_3std[0], color='green', linestyle='--', label='UCl (Mean + 3σ)')
plt.title('Defect Rate Over Time with Control Limits')
plt.xlabel('Time')
plt.ylabel('Defect Rate')
plt.legend()
plt.gca().xaxis.set_major_formatter(plt.matplotlib.dates.DateFormatter('%b %Y'))

# 4
fig, ax1 = plt.subplots(figsize=(10, 6))

# the first x-axis: Defects
ax1.plot(df.index, df['Defects'], color='r', marker='o', label='Defects')
ax1.set_ylabel('Defects', color='r')

# formatting it as month and year
ax1.xaxis.set_major_formatter(plt.matplotlib.dates.DateFormatter('%b %Y'))

# Plotting Secondary axis: Opportunities
ax2 = ax1.twinx()
ax2.plot(df.index, df['Opportunities'], color='b', marker='o', label='Opportunities')
ax2.set_ylabel('Opportunities', color='b')

# Plotting first axis
ax1.plot(df.index, defect_rate, color='g', marker='o', label='Defect Rate')
ax1.axhline(y=mean_defect_rate, color='orange', linestyle='--', label='Mean Defect Rate')
ax1.axhline(y=limit_2std[0], color='magenta', linestyle='--', label='UCL (Mean + 2σ)')
ax1.axhline(y=limit_3std[0], color='cyan', linestyle='--', label='UCL (Mean + 3σ)')


ax1.set_title('Defects, Opportunities, and Defect Rate Over Time')
plt.legend()

plt.show()

"""** # 5**


1.  for the first plot we can see that the # of defects is lower around July 2016  and higher when around July 2018, although around July 2017 we see a big spike of defects.
2.   for the second graph we can see that the number of opportunites over time have a more stable outcome compared to the first plot, since the first plot has deeper spikes and multiple. And we could see that it's most steady around April to October 2017.
3.  The last plot tells you about the defected rates trends in where it fluctuates and where it is the most stable, here we see that it fluctuates between July 2016 and before October 2016 and then it is the most stable after October 2016.



"""