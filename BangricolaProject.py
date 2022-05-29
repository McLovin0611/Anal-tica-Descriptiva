# -*- coding: utf-8 -*-
"""
Created on Sun May 29 12:25:17 2022

@author: lenovo
"""

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

#importing data set
data = pd.read_excel('Cartera de Préstamos, BAGRICOLA, 2017-2022.xlsx')

#data mining
data.head(data)
data.describe(data)
data.info(data)
print("Missings in the data:")
display(data.isnull().sum())


from pandas_profiling import ProfileReport
prof = ProfileReport(data)
prof.to_file(output_file='data_html')





