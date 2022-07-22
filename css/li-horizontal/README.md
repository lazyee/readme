#### li标签横向排布
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>li标签横向排布</title>
    <style type="text/css">
        div{
            float: left;
            background-color: #B5B4B4;
        }
        ul{
            list-style: none;
            margin: 0 auto;
            padding: 0;
        }
        li{
            list-style: none;
            margin: 2px;
            padding: 2px;
            display: inline;
        }
    </style>
</head>
<body>
    <div>
        <ul>
            <li><a href="#">链接</a></li>
            <li><a href="#">链接</a></li>
            <li><a href="#">链接</a></li>
            <li><a href="#">链接</a></li>
            <li><a href="#">链接</a></li>
        </ul>
    </div>
</body>
</html>
```