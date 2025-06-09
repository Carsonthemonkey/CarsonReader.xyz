<script lang="ts">
	import type { Component, Snippet } from 'svelte';
	import IconGraduationCap from '~icons/lucide/graduation-cap';

	interface Props {
		Icon: Component;
		children: Snippet;
		iconClasses?: string;
	}
	let { Icon, children, iconClasses }: Props = $props();
</script>

<section class="flex flex-row content-center justify-center">
	<div
		class="isolate max-w-4xl overflow-clip rounded-3xl border-3 border-sky-800/50 bg-slate-900/50 backdrop-blur-sm mx-6"
	>
		<div
			class="absolute -z-10 h-full w-full rounded-3xl border-3 border-sky-800/50 blur-md"
		></div>
		<div class="flex flex-col sm:flex-row ">
			<div class="flex items-center px-7 py-5 text-3xl justify-center sm:pr-0">
				<div class={"bg-orange rounded-full bg-slate-900 p-5 " + iconClasses}>
					<Icon />
				</div>
			</div>
			<div class="m-7 mt-0 sm:mt-7 text-center sm:text-left flex flex-col justify-center">
				{@render children()}
			</div>
		</div>
	</div>
</section>
