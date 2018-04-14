import pymysql
import requests
import json

subjects = {
    'Miljö': ['miljö', 'skog', 'hav', 'sjö', 'fjäll', 'förorening', 'luft', 'bränsle', 'fosil', 'elektricitet', 'förnyelsebar'],
    'Utbildning': ['utbildning', 'skola', 'gymnasie', 'gymnasium'],
    'Skatter': ['skatter', 'skuld'],
    #'Politik': ['politik', 'parti'],
    'Integration': ['invandring', 'integration', 'immigration'],
    'Bostad': ['bostad', 'bostäder', 'hus', 'lägenhet', 'villa', 'hyresrätt'],
    'Säkerhet': ['säkerhet', 'polis', 'försvar', 'armén', 'värnplikt'],
    'Sjukvård': ['sjukvård', 'sjukhus', 'läkemedel', 'läkare', 'sjuksköterska', 'väntetid']
}

db = pymysql.connect(host='eightballcollective.mysql.database.azure.com',
                     user='eightball@eightballcollective',
                     passwd='Mallesuger96',
                     db='hack4sweden',
                     charset='utf8')

cur = db.cursor()
cur.execute('SELECT hangar_id, dokument_url_html FROM dokument')

for row in cur.fetchall():
    url = row[1]
    text = requests.get(url).text
    tags = list()

    for tag in subjects:
        count = 0
        for trigger in subjects[tag]:
            count += text.count(trigger)
        if count >= 20: tags.append(tag)

    data = json.dumps(tags)

    cur.execute('INSERT INTO taggar (hangar_id, tag) VALUES(%s, %s)', (row[0], data))
    db.commit()

db.close()
