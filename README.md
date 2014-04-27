# Space Notice

Space Notice is a service provides API to send Push Notification to OS X.

### Setup

First you have to go to <https://space-notice.com> and sign up via GitHub.

Then you will see a sample APPLICATION with TOKEN.

This TOKEN you will use for pushing notifications and subscribing to APPLICATION's notifications.

### Push

```
curl -d "message=TEXT&title=PROJECT&url=URL" https://space-notice.com/p/TOKEN
```

[Other examples](https://github.com/releu/space-notice/wiki/How-to-push-a-notification)

### Subscribe

Open the following link in Safari:

```
https://space-notice.com/auth/github?token=TOKEN
```

You can give this link to your teammates and they will be subscribed.
