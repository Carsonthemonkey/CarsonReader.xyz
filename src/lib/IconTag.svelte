<script lang="ts">
	import type { Snippet } from 'svelte';

	let { iconClass, children }: { iconClass: string; children: Snippet } = $props();
</script>

<div
	class="group flex items-center rounded-full border-1 border-green-300/0 px-1 transition-all hover:border-green-300 hover:bg-green-300/10 hover:text-green-300"
>
	<i class={iconClass}></i>
	<span
		class="max-w-0 overflow-hidden whitespace-nowrap opacity-0 transition-all duration-400 not-group-hover:duration-200 group-hover:mx-1 group-hover:max-w-[200px] group-hover:opacity-100"
		>{@render children()}</span
	>
</div>
