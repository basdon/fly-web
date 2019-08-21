<h2>Failed logins</h2>
{@if isset($falcleared)}
	<p class="msg success">Unseen failed logins cleared.</p>
{@endif}
{@unsafe $pagination}
<table width="100%">
	<thead>
		<tr>
			<th>When</th><th>IP</th><th>Service</th>
		</tr>
	</thead>
	<tbody>
		{@eval $hasnew = false;$maxstamp = 0;$l = $failedlogins->fetch()}
		{@if $l}
			{@do}
				{@if !$maxstamp}{@eval $maxstamp = $l->stamp}{@endif}
				<tr>
					<td>{@unsafe format_time_since($l->stamp)} ({@unsafe date('j M Y H:i', $l->stamp)}){@if $hasnew = ($l->stamp > $lastseen)} <strong>(new!)</strong>{@endif}</td>
					<td>{$l->ip}</td>
					<td>{@if $l->isweb}web{@else}game{@endif}</td>
				</tr>
				{@eval $l = $failedlogins->fetch()}
				{@if $hasnew && (!$l || $l->stamp < $lastseen)}
					<tr><td colspan="3" style="text-align:center"><a href="account.php?action=fal&amp;clear&amp;cleartime={@unsafe $maxstamp}&amp;confirm={@unsafe $clearkey}">Clear new notifications</a></td></tr>
				{@endif}
			{@enddowhile $l}
		{@endif}
	</tbody>
</table>
{@unsafe $pagination}
