<script lang="ts">
	import type { Component, Snippet } from 'svelte';
	import IconGraduationCap from '~icons/lucide/graduation-cap';

	interface Props {
		Icon: Component;
		children: Snippet;
	}
	let { Icon, children }: Props = $props();
</script>

<section class="flex flex-row content-center justify-center">
	<div
		class="isolate max-w-2xl overflow-clip rounded-3xl border-3 border-sky-800/50 bg-slate-900/50 backdrop-blur-sm"
	>
		<div
			class="absolute -z-10 h-full w-full rounded-3xl border-3 border-sky-800/50 blur-md"
		></div>
		<div class="flex flex-row">
			<div class="flex items-center p-7 text-3xl">
				<div class="bg-orange rounded-full bg-slate-900 p-5 text-orange-300">
					<Icon />
				</div>
			</div>
			<div class="my-7 mr-7">
				{@render children()}
			</div>
		</div>
	</div>
</section>
