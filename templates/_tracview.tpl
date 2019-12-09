<!DOCTYPE html>
<html lang="en">
<head>
	<title>{$trac_summary} :: basdon.net aviation server</title>
	{@render defaulthead.tpl}
	<style>
		{@render trac_inline_style.css}
		table.trac td.label {
			background: #c8c8e8;
			font-weight: bold;
		}
		table.trac.respond input:not([type=submit]), table.trac.respond textarea, table.trac.respond select, table.trac.respond td:last-child {
			width: 100%;
		}
		textarea {
			height: 8em;
		}
	</style>
</head>
<body>
	{@render skip.tpl}
	{@render defaultheader.tpl}
	<div class="singlebody">
		<p><a href="trac.php">Tracker</a> &gt; {$trac_summary}</p>
		{@if isset($trac)}
			<h2 id="main">Tracker: {$trac->summary}</h2>
			<table id="main" class="trac">
				<tr>
					<td class="label">Summary</td><td colspan="5">{$trac->summary}</td>
				</tr>
				<tr>
					<td class="label">Status</td><td class="status{@unsafe $trac->status}">{@unsafe $trac_statuses[$trac_status]}</td>
					<td class="label">Impact</td><td>{@unsafe $trac_severities[$trac_impact]}</td>
					<td class="label">Reported</td><td>{@unsafe format_datetime($trac->stamp)}</td>
				</tr>
				<tr>
					<td class="label">Reporter</td><td>{@unsafe linkuser($trac)}</td>
					<td class="label">Visibility</td><td>{@unsafe $trac_visibility}</td>
					<td class="label">Updated</td><td>{@unsafe format_datetime($trac->updated)}</td>
				</tr>
				<tr>
					<td class="label" colspan="6">Description</td>
				</tr>
				<tr>
					<td colspan="6">{$trac->description}</td>
				</tr>
			</table>
			<h4>Comments</h4>
			{@if group_is_user_notbanned($usergroups)}
				<h4>Add comment</h4>
				<form method="post" action="tracview.php?id={@unsafe $id}">
					<table class="trac respond">
						<tr>
							<td>{@input area comment}</td>
						</tr>
						<tr>
							<td style="text-align:center">{@input submit Comment}</td>
						</tr>
					</table>
				</form>
				{@if group_is_admin($usergroups)}
					<h4>Update ticket</h4>
					<form method="post" action="tracview.php?id={@unsafe $id}">
						<table class="trac respond">
							<tr><td class="label">Summary</td><td>{@input text summary maxlength="80"}</td></tr>
							{@if group_is_owner($usergroups)}
								<tr><td class="label">Status</td><td>{@input combo status $trac_statuses}</td></tr>
							{@endif}
							<tr><td class="label">Impact</td><td>{@input combo severity $trac_severities_raw}</td></tr>
							<tr><td class="label">Visibility</td><td>{@input combo visibility $trac_visibilities}</td></tr>
							<tr>
								<td></td><td style="text-align:center">{@input submit Update}</td>
							</tr>
						</table>
					</form>
				{@endif}
			{@endif}
		{@else}
			<h2 id="main">Tracker</h2>
			<p>This ticket does not exist or is not visible for you.</p>
		{@endif}
	</div>
	{@render defaultfooter.tpl}
</body>
</html>
