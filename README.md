# DuinoCoinTelegramBot

### Create bot, and get token bot:
- https://t.me/botfather    (create bot and copy token bot)

### Get chat ID:
- https://t.me/myidbot      (to get chat ID and copy chat ID)

Change in the script, the variables token, id and the username of your duinocoin wallet.

```
TOKEN="YOUR_TOKEN_BOT"          (change YOUR_TOKEN_BOT with copied token bot)
ID="YOUR_CHAT_ID"               (change YOUR_CHAT_ID with copied chat ID)
WALLET="YOUR_USERNAME_WALLET"   (change YOUR_USERNAME_WALLET with your username wallet)
```

### Install package
`sudo apt install -y jq`

### Assign execution permissions
`chmod a+x duinocoin.sh`

### Launch script
`./duinocoin.sh`

### Add cron, in this example, it runs every hour, every day of the week.  
`crontab -e`

`0 * * * *  /path/to/script/duinocoin.sh`
