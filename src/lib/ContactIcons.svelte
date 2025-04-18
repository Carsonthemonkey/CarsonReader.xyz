<script lang="ts">
	import IconGithub from '~icons/line-md/github';
	import IconLinkedIn from '~icons/line-md/linkedin';
	import IconEmail from '~icons/line-md/email';
	import { onMount } from 'svelte';

	let { delay }: { delay: number } = $props();
	let loaded = $state(false);

	onMount(() => {
		setTimeout(() => {
			loaded = true;
		}, delay * 1000);
	});
</script>

{#if loaded}
	<div class="m-5 flex justify-center gap-10 text-5xl transition-all">
		<a href="https://www.github.com/Carsonthemonkey">
			<IconGithub />
		</a>
		<a href="mailto:carson.a.reader@gmail.com">
			<IconEmail />
		</a>
		<a href="https://www.linkedin.com/in/carson-reader-7a1554266">
			<IconLinkedIn class="linkedin-icon" />
		</a>
	</div>
{/if}
