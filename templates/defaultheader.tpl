<div>
	<header>
		<small>
			{@if isset($loggeduser)}
				Welcome, {$loggeduser->name}
			{@else}
				<a href="login.php">[Log In]</a>
			{@endif}
		</small>
		<h1>basdon.net aviation server</h1>
		<p style="float:left;margin-right:2ex">IP: <a href="samp://basdon.net:7777">basdon.net:7777</a> :: <a href="article.php?title=How_To_Join">How to join</a></p>
		<p><a href="index.php">Home</a> :: <a href="news.php">News</a> :: <a href="flights.php">Flights</a> :: <a href="map.php">Live Map</a> :: <a href="article.php">Articles</a> :: <a href="bbs.php">Message Board</a> :: <a href="stats.php">Stats</a></p>
	</header>
</div>
{@foreach $__msgs as $msg}
	<p class="msg">{$msg}</p>
{@endforeach}
