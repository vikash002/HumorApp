from scrapy import Spider
from scrapy.selector import Selector
from scrapy.selector import HtmlXPathSelector
from scrapy.http import Request

from nine.items import NineItem

class nineSpider(Spider):
    name = "9gag"
    allowed_domains = ["9gag.com"]

    start_urls = [
        "http://9gag.com/cute/fresh",
	"http://9gag.com/girl/fresh",
	"http://9gag.com/meme/fresh",
	"http://9gag.com/wtf/fresh",
	"http://9gag.com/geeky/fresh",
    ]
    

    def parse(self, response):
        questions = HtmlXPathSelector(response).select('//*[@id="list-view-2"]/div[1]')
	items = []
        for question in questions:
            item = NineItem()
            item['title'] = question.select((
                '//*[@id="list-view-2"]/div[1]/article/div/a/img/@alt')).extract() 
            item['link'] = question.select(
              '//*[@id="list-view-2"]/div[1]/article/div/a/img/@src').extract()
	    items.append(item)	
 	return items

