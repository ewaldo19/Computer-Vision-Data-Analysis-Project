<h1>Computer Vision Data Analysis Project</h2>

<body><p align="justify">
To view the Data Visualization output in a much more interactive experience: <a href="https://nbviewer.org/github/ewaldo19/Computer-Vision-Data-Analysis-Project/blob/main/Data%20Visualization/Data%20Viz%20Conferences.ipynb">Data Visualization - Computer Vision</a>.<br><br>
This project aims to develop a data visualization showcasing conference-related information over the years. It involves presenting statistics such as the quantity of published papers, identifying the most established authors around the globe, and many more. Notably, the main focus is on comparing the number of authors and published papers from Indonesia with those from other Southeast Asian countries and globally. With the help of this project, I've also contributed to the  <a href="https://github.com/indonesia-vision-ai/awesome-indonesia-vision-research-conference">Awesome Indonesia Computer Vision Research - Conference Publication</a> repository. The conferences considered for this analysis span from 2002 - present and include BMVC, WACV, CVPR, ICCV, and ECCV.</p>

<h2>How to Run Project</h2>

<p align = "justify"><ol type = "1">
  <li>On <strong>Webscrape Conferences</strong> folder, open <b>Webscrape All Conferences.ipynb</b>
  
  Run each cell accordingly
    
  If Python packages are not installed, install it beforehand to ensure that the webscraping process can be executed properly.
  
  Requests:
  <pre lang="console">pip install requests</pre>

  Pandas: 
  <pre lang="console">pip install pandas</pre>

  BeautifulSoup:
  <pre lang="console">pip install beautifulsoup4</pre>
  </li>
  <br>
  <li>On <strong>Data Cleaning and Insertion</strong> folder, open <b>Database Creation and Insertion.sql</b>
    
  Run each SQL query accordingly to create the database to store the web scraped data, import the csv file into a temporary table before storing it in the real table. Make sure the data is clean and there are no missing data/data inaccuracies in the database.
  
  Import the author nationality files so that each author has their nationality and alternate nationality to provide more valuable insights regarding the data.</li>
  <br>
  <li>On <strong>Data Querying</strong> folder, open <b>Data Querying.sql</b>
  
  Run each SQl query to show the data you want to view, then convert each SQL query result into a csv so that it will be easily more accessible for viewing and data visualizing</li>
  <br>
  <li>On <strong>Data Visualization</strong> folder, open <strong>Data Viz Conferences.ipynb</strong>

  Run each cell accordingly to display each and every data visualization correctly. Before running each cell, make sure that all python packages needed are installed.

  Chart Studio:
  <pre lang="console">pip install chart_studio</pre>

  Cufflinks:
  <pre lang="console">pip install cufflinks</pre>

  Seaborn:
  <pre lang="console">pip install seaborn</pre>

  Plotly:
  <pre lang="console">pip install plotly</pre>

  Wordcloud:
  <pre lang="console">pip install wordcloud</pre>

  Matlplotlib:
  <pre lang="console">pip install matplotlib</pre>
  </li>
</ol></p></body>
