<script lang="ts">
	import IconGithub from '~icons/line-md/github';
	import IconLinkedIn from '~icons/line-md/linkedin';
	import IconEmail from '~icons/line-md/email';
	import { onMount } from 'svelte';
	import { prefersReducedMotion } from 'svelte/motion';

	let { delay }: { delay: number } = $props();
	let loaded = $state(false);
	
	onMount(() => {
		setTimeout(() => {
			loaded = true;
		}, delay * 1000);
	});
</script>

{#if loaded || prefersReducedMotion.current}
	<div class="m-5 flex justify-center gap-10 text-5xl transition-all">
		<a href="https://www.github.com/Carsonthemonkey" aria-label="GitHub">
			<IconGithub
				class="transform-gpu drop-shadow-2xl/0 motion-safe:transition-all motion-safe:hover:-translate-y-1 motion-safe:hover:scale-110 hover:drop-shadow-2xl/60 hover:drop-shadow-blue-600"
			/>
		</a>
		<a href="mailto:carson.a.reader@gmail.com" aria-label="Email">
			<IconEmail
				class="transform-gpu drop-shadow-2xl/0 motion-safe:transition-all motion-safe:hover:-translate-y-1 motion-safe:hover:scale-110 hover:drop-shadow-2xl/60 hover:drop-shadow-blue-600"
			/>
		</a>
		<a href="https://www.linkedin.com/in/carson-reader-7a1554266" aria-label="LinkedIn">
			<IconLinkedIn
				class="transform-gpu drop-shadow-2xl/0 motion-safe:transition-all motion-safe:hover:-translate-y-1 motion-safe:hover:scale-110 hover:drop-shadow-2xl/60 hover:drop-shadow-blue-600"
			/>
		</a>
	</div>
{/if}
