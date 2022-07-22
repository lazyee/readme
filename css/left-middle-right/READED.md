## 5种布局实现左中右布局
##### 绝对定位
```html
<html>
    <head>
        <style>
            #container{
                position:relative;
                width:100%;
                height:100px;
            }
            .left-side{
                width:100px;
                height:100%;
                left:0;
                top:0;
                background-color:blue;
                position:absolute;
            }
            .middle-side{
                margin: 0 100px;
                height: 100%;
                background-color:red;
            }
            .right-side{
                width:100px;
                height:100%;
                top:0;
                right:0;
                position:absolute;
                background-color:yellow;
            }
        </style>
    </head>
    <body>
        <div id="container">
            <div class="left-side"></div>
            <div class="middle-side"></div>
            <div class="right-side"></div>
        </div>
    </body>
</html>
```
##### Flex布局(Flex)
```html
<html>
    <head>
        <style>
            #container{
                display: flex;
                width:100%;
                height:100px;
            }
            .left-side{
                width:100px;
                height:100%;
                background-color:blue;
            }
            .middle-side{
                flex:1;
                height: 100%;
                background-color:red;
            }
            .right-side{
                width:100px;
                height:100%;
                background-color:yellow;
            }
        </style>
    </head>
    <body>
        <div id="container">
            <div class="left-side"></div>
            <div class="middle-side"></div>
            <div class="right-side"></div>
        </div>
    </body>
</html>
```
##### 浮动布局(Float)
```html
<html>
    <head>
        <style>
            #container{
                width:100%;
                height:100px;
            }
            .left-side{
                float: left;
                width:100px;
                height:100%;
                background-color:blue;
            }
            .middle-side{
                height: 100%;
                margin-left: 100px;
                margin-right: 100px;
                background-color:red;
            }
            .right-side{
                float: right;
                width:100px;
                height:100%;
                background-color:yellow;
            }
        </style>
    </head>
    <body>
        <div id="container">
            <div class="left-side"></div>
            <div class="right-side"></div>
            <!--在float模式下,中间的要放在最后-->
            <div class="middle-side"></div>
        </div>
    </body>
</html>
```
##### 表格布局(Table)
```html
<html>
    <head>
        <style>
            #container{
                width:100%;
                height:100px;
                display: table;
            }
            .left-side{
                display: table-cell;
                width:100px;
                height:100%;
                background-color:blue;
            }
            .middle-side{
                display: table-cell;
                height: 100%;
                background-color:red;
            }
            .right-side{
                display: table-cell;
                width:100px;
                height:100%;
                background-color:yellow;
            }
        </style>
    </head>
    <body>
        <div id="container">
            <div class="left-side"></div>
            <div class="middle-side"></div>
            <div class="right-side"></div>
        </div>
    </body>
</html>
```
##### 网格布局(Grid)
```html
<html>
    <head>
        <style>
            #container{
                width:100%;
                height:100px;
                display: grid;
                grid-template-rows: 100px;
                grid-template-columns: 100px auto 100px;
            }
            .left-side{
                background-color:blue;
            }
            .middle-side{
                background-color:red;
            }
            .right-side{
                background-color:yellow;
            }
        </style>
    </head>
    <body>
        <div id="container">
            <div class="left-side"></div>
            <div class="middle-side"></div>
            <div class="right-side"></div>
        </div>
    </body>
</html>
```