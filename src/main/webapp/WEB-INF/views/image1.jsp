<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Search Page</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <form id="search-form">
        <input type="text" id="search-input" name="search" placeholder="Enter search term">
        <button type="submit">Search</button>
    </form>
    <div id="results">
        <p>Results:</p>
        <div class="results"></div>
    </div>

    <script>
        $(document).ready(function() {
            $('#search-form').on('submit', function(event) {
                event.preventDefault();
                var searchTerm = $('#search-input').val();
                $.ajax({
                    url: 'http://localhost:5000/search',
                    type: 'GET',
                    data: { term: searchTerm },
                    success: function(response) {
                        console.log("Success");
                        console.log(response);
                        $('.results').text(response.result);
                    },
                    error: function(error) {
                        console.log("Error");
                        console.log(error);
                    }
                });
            });
        });
    </script>
</body>
</html>
