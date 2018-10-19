<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
</head>

<script>
    var service = 'http://localhost:8080/ticket';

    var RestGet = function (id) {
        $.ajax({
            type: 'GET',
            url: service + '/get/' + id,
            dataType: 'json',
            accept: 'json',
            contentType: 'application/json;utf-8',
            async: false,
            success: function (result) {
                $('#response').html(JSON.stringify(result))
            },
            error: function (jqXHR, testStatus, errorThrown) {
                $('#response').html(JSON.stringify(jqXHR))
            }
        });
    };

    var RestGetAll = function () {
        $.ajax({
            type: 'GET',
            url: service + '/get/all',
            dataType: 'json',
            accept: 'json',
            contentType: 'application/json;utf-8',
            async: false,
            success: function (result) {
                $('#response').html(JSON.stringify(result))
            },
            error: function (jqXHR, testStatus, errorThrown) {
                $('#response').html(JSON.stringify(jqXHR))
            }
        });
    };

    var RestDelete = function (id) {
        $.ajax({
            type: 'DELETE',
            url: service + '/delete/' + id,
            dataType: 'json',
            accept: 'json',
            contentType: 'application/json;utf-8',
            async: false,
            success: function (result) {
                $('#response').html(JSON.stringify(result))
            },
            error: function (jqXHR, testStatus, errorThrown) {
                $('#response').html(JSON.stringify(jqXHR))
            }
        });
    };

    var RestPost = function (dateOfIssue, series) {
        var JSONObject = {
            'dateOfIssue': dateOfIssue,
            'series': series
        };

        $.ajax({
            type: 'POST',
            url: service + '/add',
            contentType: 'application/json;utf-8',
            dataType: 'json',
            accept: 'json',
            data: JSON.stringify(JSONObject),
            async: false,
            success: function (result) {
                $('#response').html(JSON.stringify(result))
            },
            error: function (jqXHR, testStatus, errorThrown) {
                $('#response').html(JSON.stringify(jqXHR))
            }
        });
    };

    var RestPut = function (id, dateOfIssue, series) {
        var JSONObject = {
            'id': id,
            'dateOfIssue': dateOfIssue,
            'series': series
        };

        $.ajax({
            type: 'PUT',
            url: service + '/update',
            contentType: 'application/json;utf-8',
            dataType: 'json',
            accept: 'json',
            data: JSON.stringify(JSONObject),
            async: false,
            success: function (result) {
                $('#response').html(JSON.stringify(result))
            },
            error: function (jqXHR, testStatus, errorThrown) {
                $('#response').html(JSON.stringify(jqXHR))
            }
        });
    }

</script>

<body>
<h1>Ticket's info</h1>

<table class="table">
    <tr>
        <th>Request type</th>
        <th>URL</th>
        <th>Value</th>
    </tr>

    <tr>
        <td>Get ticket by id <code><strong>GET</strong></code></td>
        <td>/ticket/get/{id}</td>
        <td>
            id: <input id="getCatID" value="">
            <button type="button" onclick="RestGet($('#getCatID').val())">try</button>
        </td>
    </tr>

    <tr>
        <td>Get all tickets<code><strong>GET</strong></code></td>
        <td>/ticket/get/all</td>
        <td>
            <button type="button" onclick="RestGetAll()">try</button>
        </td>
    </tr>

    <tr>
        <td>Add ticket<code><strong>POST</strong></code></td>
        <td>/ticket/add</td>
        <td>
            <form class="form-inline">
                dateOfIssue: <input id="postDateOfIssue" value="default date of issue">
                dateOfIssue: <input id="postSeries" value="default series">
                <button type="button" onclick="RestPost($('#postDateOfIssue').val(), $('#postSeries').val())">try
                </button>
            </form>
        </td>
    </tr>

    <tr>
        <td>Update ticket<code><strong>PUT</strong></code></td>
        <td>/ticket/update</td>
        <td>
            <form class="form-inline">
                id: <input id="inputId" value="">
                dateOfIssue: <input id="putDateOfIssue" value="default date of issue">
                dateOfIssue: <input id="putSeries" value="default series">
                <button type="button"
                        onclick="RestPut($('#inputId').val(), $('#putDateOfIssue').val(),$('#putSeries').val())">try
                </button>
            </form>
        </td>
    </tr>

    <tr>
        <td>Delete ticket by id <code><strong>GET</strong></code></td>
        <td>/ticket/delete/{id}</td>
        <td>
            id: <input id="deleteId" value="">
            <button type="button" onclick="RestDelete($('#deleteId').val())">try</button>
        </td>
    </tr>
</table>

<div class="panel panel-default">
    <div class="page-heading">
        <strong>RESPONSE</strong>
    </div>
    <div class="panel-body" id="response"></div>
</div>
</body>
</html>
