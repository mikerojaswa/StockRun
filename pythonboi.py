import csv
import pprint

reader = csv.DictReader(open('/Users/michael/Code/StockRun/NASDAQ.csv', 'rt'))
dict_list = []

for line in reader:
	dict_list.append(line)

pprint.pprint(dict_list)