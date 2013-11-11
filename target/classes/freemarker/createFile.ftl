
<html>
        <head>
            <title>SignUp</title>
                <style type="text/css">
			      .label {text-align: right}
			      .error {color: red}
			    </style>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <!-- Latest compiled and minified CSS -->
            <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" media="screen">
            <!-- Optional theme -->
            <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-theme.min.css">
        </head>
        <body>
            <div class="container">
                <div class="jumbotron">
				    <h2>Create a File</h2>
				    <form method="post">
				      <table class="table table-hover" >
				        <tr>
				          <td class="label">File Name</td>
				          <td><input type="text" name="name" value="${name}"></td>
				        </tr>
				        <tr>
				        	<td class="label">Access Type</td>
				        	<td><select name="accessType">	
							<option value="Private">Private</option>
							<option value="Public">Public</option>
							</select></td>
				        </tr>
					</table>
				    </form>
				    
				    <div id="submitButton" class="btn btn-primary">Upload</div>
                    <!-- calls getBooks() from HomeResource -->
                </div>
            </div> <!-- end of container -->
           
            <!-- script tags -->
            <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
            <script src="//code.jquery.com/jquery.js"></script>
            <!-- Latest compiled and minified JavaScript -->
            <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
            <!-- application ui scripts -->
			
			<script>
			$.fn.serializeObject = function()
				{
				    var o = {};
				    var a = this.serializeArray();
				    $.each(a, function() {
				        if (o[this.name] !== undefined) {
				            if (!o[this.name].push) {
				                o[this.name] = [o[this.name]];
				            }
				            o[this.name].push(this.value || '');
				        } else {
				            o[this.name] = this.value || '';
				        }
				    });
				    return o;
				};
				
				$(function() {
				    $('#submitButton').click(function() {
//				        alert(JSON.stringify($('form').serializeObject()));
				        $.ajax({
			        url: "/dropbox/v1/users/${userID}/files",
			        type: 'POST',    
			        contentType: 'application/json',
			        data:JSON.stringify($('form').serializeObject()), 
			        success: function(result) {
			         window.location = "/dropbox/v1/users/${userID}";
			  	}
			  	});

				    });
				});
			</script>
        </body>
</html>
