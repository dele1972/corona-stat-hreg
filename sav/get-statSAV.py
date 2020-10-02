#!/usr/bin/python3

import os
from datetime import datetime
# from lxml import etree
from io import StringIO
# import requests
import glob
import cgitb

print("Content-type: text/plain\r\n")
cgitb.enable(display=0, logdir="log")
HTML_INPUT_URL = "https://www.hannover.de/Leben-in-der-Region-Hannover/" \
            "Verwaltungen-Kommunen/Die-Verwaltung-der-Region-Hannover/" \
            "Region-Hannover/Aktuelle-Informationen-zum-Coronavirus-der-Region-Hannover"
PATH_HTML_OUTPUT = "html_files"
XPATH_TITLE = "/html/head/title"
XPATH_ARTICLE = "/html/body/div/main/div[@id='main_content']//article[@class='content-view-full']"
XPATH_DATE = "/html/body/div/main/div[@id='main_content']//article[@class='content-view-full']//time/@content"

TEMPLATE = """<!DOCTYPE html>
<html lang="de">
<head>
{title}
</head>
<body>
{body}
</body>
</html>
"""

# --- get timestamp

now = datetime.now()
year = now.strftime("%Y")
month = now.strftime("%m")
day = now.strftime("%d")

# --- get html

# page=requests.get(HTML_INPUT_URL)
# # --- Grabbing an URL and Parse it to html, title, extracted_body, modified_date_time, modified_date
# # Set explicit HTMLParser
# parser = etree.HTMLParser()
# # Decode the page content from bytes to string
# html = page.content.decode("utf-8")
# tree = etree.parse(StringIO(html), parser=parser)
# article = tree.xpath(XPATH_ARTICLE)
# extracted_body = "".join([etree.tostring(element, encoding="unicode", pretty_print=True) for element in article])

# title = "".join([etree.tostring(bar, encoding="unicode", pretty_print=True) for bar in tree.xpath(XPATH_TITLE)])
# mod_date = tree.xpath(XPATH_DATE)[0][:10]
# modified_date_time = tree.xpath(XPATH_DATE)[0][:19].replace(":", ".")

# --- write

# if not glob.glob(PATH_HTML_OUTPUT + "/" + modified_date_time + "_*.html"):
#     filename_1 = PATH_HTML_OUTPUT + "/" + modified_date_time + "_original__" + year + "-" + month + "-" + day + ".html"
    
#     if not os.path.isdir(PATH_HTML_OUTPUT):
#         os.mkdir(PATH_HTML_OUTPUT)
    
#     with open(filename_1, "w") as text_file:
#         print(html, file=text_file)
    
#     filename_2 = PATH_HTML_OUTPUT + "/" + modified_date_time + "_extracted__" + year + "-" + month + "-" + day + ".html"
#     # content = 
#     with open(filename_1, "w") as text_file:
#         print(TEMPLATE.format(body=extracted_body, title=title), file=text_file)

#     print("Document grabed and saved (which is modified on: " + modified_date_time + ")")
# else:
#     print("GRABED DOCUMENT (modified on " + modified_date_time + ") ALREADY EXISTS!")

# --- end

print("hj")
