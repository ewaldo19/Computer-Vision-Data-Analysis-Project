<h1>Computer Vision Data Analysis Project</h2>

<body><p align="justify">
To view the Data Visualization output in a much more interactive experience: <a href="https://nbviewer.org/github/ewaldo19/Computer-Vision-Data-Analysis-Project/blob/main/Data%20Visualization/Data%20Viz%20Conferences.ipynb">Data Visualization - Computer Vision</a>.<br><br>
This project aims to develop a data visualization showcasing conference-related information over the years. It involves presenting statistics such as the quantity of published papers, identifying the most established authors around the globe, and many more. Notably, the main focus is on comparing the number of authors and published papers from Indonesia with those from other Southeast Asian countries and globally. With the help of this project, I've also contributed to the  <a href="https://github.com/indonesia-vision-ai/awesome-indonesia-vision-research-conference">Awesome Indonesia Computer Vision Research - Conference Publication</a> repository. The conferences considered for this analysis span from 2002 - present and include BMVC, WACV, CVPR, ICCV, and ECCV.</p>

<p>Below are some of the Data Visualizations that I believe are important insights regarding the data I gathered:</p>
<h4>New Authors from Each Conferences</h4>
<img width="1000" alt="image" src="https://github.com/ewaldo19/Computer-Vision-Data-Analysis-Project/assets/57058557/f9c94808-c569-453c-bfab-5fffa8db11c1">
<br><br>
<p align = "justify">The above graph visualizes how many new authors have published for each conference every year. It is seen that every year, a bunch of new emerging authors will come to the scene, this tells us that the interest in Computer Vision is growing rapidly and more individuals have become more knowledgeable about it.</p>
<br>
<h4>Number of Papers Publised each Year</h4>
<img width="1000" alt="image" src="https://github.com/ewaldo19/Computer-Vision-Data-Analysis-Project/assets/57058557/97e773bd-b1e5-4db3-b0f6-41cf81be189f">
<br><br>
<p align = "justify">The above chart illustrates how many papers are published each year for every conference (2003-present). It shows us that authors are becoming more skilled and creative about what topics they can bring to the table as papers are published more each year.</p>
<br>

<h4>Wordcloud for All Papers</h4>
<img width = "1000" src ="https://github.com/ewaldo19/Computer-Vision-Data-Analysis-Project/blob/0e1aae7d552b76b357b1ac2fa99432a400988688/wordcloud.jpg">
<br><br>
<p align = "justify">The image above shows what word or phrase is most used in a title for all conferences (CVPR, WACV, ECCV, ICCV, and BMVC)</p>

<h4>Number of Authors in South East Asia</h4>
<img width="1000" alt="image" src="https://github.com/ewaldo19/Computer-Vision-Data-Analysis-Project/assets/57058557/67fb936c-470d-49dc-8320-2be1fea28eac">
<br><br>
<p align = "justify">The graph above illustrates how many papers are published by South East Asian authors. As we can see, Vietnam seems to be leading ahead by quite some distance in terms of the number of authors and number of papers published, followed by Singapore. As for Indonesia, we have only published 124 papers coming from 43 different authors through these 5 conferences (2003-2023).

Disclaimer: The nationalities of the authors is not 100% accurate since I use a prediction nationality API based on their names.</p>
<br><br>
The following is the repository to the Indonesian authors' webpages such as Profile, Google Scholar, and DBLP:
<a href = "https://github.com/indonesia-vision-ai/awesome-indonesia-vision-research-conference/blob/main/AUTHORS.md">Indonesian Authors Profile</a>

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
  <li>On Predict Nationality folder, open <b>predicty.py</b>

  Run predict.py, with the webscraped author names data and valid API key
  For this I used namsor.app to predict the nationality based on the authors' names. So, you need to create an account before to get the valid API key. Of course, the result of this is not 100% accurate with the exception for Indonesia because I created this project specifically to view the data about Indonesia.</li>
  <li>On <strong>Data Cleaning and Insertion</strong> folder, open <b>Database Creation and Insertion.sql</b>
    
  Run each SQL query accordingly to create the database to store the web scraped data, import the csv file into a temporary table before storing it in the real table. Make sure the data is clean and there are no missing data/data inaccuracies in the database.

  Import the Countries Data.json file to ensure that the nationality column on authors table has a connection to another table.
  
  Import the author nationality files so that each author has their nationality and alternate nationality to provide more valuable insights regarding the data.
  
  Note: If you want to have the same data as the data I have, I suggest you import the Authors.json file instead of predicting the nationality as well because there are still some inaccuracies about predicting the nationality. By using the Authors.json, it corrects some data especially the data regarding Indonesia.</li>
  <br>
  <li>On <strong>Data Querying</strong> folder, open <b>Data Querying.sql</b>
  
  Run each SQl query to show the data you want to view, then convert each SQL query result into a csv so that it will be easily more accessible for viewing and data visualizing</li>
  <br>
  <li>On <strong>Data Visualization</strong> folder, open <strong>Data Viz Conferences.ipynb</strong>

  Run each cell accordingly to display each and every data visualization correctly. Before running each cell, make sure that all python packages needed are installed.

  Cufflinks:
  <pre lang="console">pip install cufflinks</pre>

  Plotly:
  <pre lang="console">pip install plotly</pre>

  Wordcloud:
  <pre lang="console">pip install wordcloud</pre>

  Matlplotlib:
  <pre lang="console">pip install matplotlib</pre>
  </li>
</ol></p></body>
