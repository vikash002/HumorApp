# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: http://doc.scrapy.org/en/latest/topics/item-pipeline.html

import csv

class NinePipeline(object):
    def process_item(self, item, spider):
        return item

class myExporter(object):

    def __init__(self):
        self.myCSV = csv.writer(open('output.csv', 'wb'))
        self.myCSV.writerow(['title', 'link'])

    def process_item(self, item, spider):
     self.myCSV.writerow([item['title'],
                                    item['link']])

     return item

