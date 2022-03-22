import random
import requests
import json
import os
import string

def main():
    pitcher_playerIDs = [543037, 434378, 453562, 594798, 425844, 519242, 477132, 453286, 518774, 605400, 545333, 572971, 544931, 592789, 471911, 622663, 547943, 450203, 456034, 593372]
    playerType = 1
    for playerID in pitcher_playerIDs: 
        for i in range(0,10):
            try:
                random_pitch = str(random.randint(0,999999))
                link = 'https://baseballsavant.mlb.com/player/random-video'
                params = {'playerId':playerID, 'playerType':playerType, 'videoType': '1583270'+random_pitch} 
                r = requests.get(url = link, params=params)
                #print(r)
                video = r.json()['link']
                filename = r.json()['title']
                filename = filename.translate(str.maketrans('', '', string.punctuation))
                filename = filename.replace('  ',' ')
                filename = filename.replace(' ','_')+'.mp4'
                video_req = requests.get(video)
                print('downloading clip {}: {}'.format(i, filename))
                with open(os.path.join('pitches_not_edited',filename), 'wb') as f:
                    f.write(video_req.content)
            except:
                print('error occurred')
        print('Finshed pitcher: {}'.format(playerID))

if __name__ == '__main__':
    main()