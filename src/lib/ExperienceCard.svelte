<script lang="ts">
	import gsap from 'gsap';
	import { ScrollTrigger } from 'gsap/ScrollTrigger';
	import { onMount, type Component, type Snippet } from 'svelte';
	import { prefersReducedMotion } from 'svelte/motion';

	let card: HTMLElement;

	interface Props {
		Icon: Component;
		title: string;
		subtitle: string;
		children: Snippet;
		iconClasses?: string;
	}
	let { Icon, title, subtitle, children, iconClasses }: Props = $props();

	onMount(() => {
		if(prefersReducedMotion.current) return;
		gsap.registerPlugin(ScrollTrigger);
		gsap.from(card, {
			y: 50,
			opacity: 0.0,
			duration: .3,
			scrollTrigger: { trigger: card, start: '55% 100%'}
		});
	})

</script>

<section bind:this={card} class="flex flex-row content-center justify-center">
	<div
		class="isolate max-w-4xl overflow-clip rounded-3xl border-3 border-sky-800/50 ~bg-slate-900/50 backdrop-blur-sm mx-6 min-w-0 hover:scale-103 transition-all hover:bg-radial-[at_50%_0%] from-slate-900/60 from-0%"
	>
		<div
			class="absolute -z-10 h-full w-full rounded-3xl border-3 border-sky-800/50 blur-md"
		></div>
		<div class="flex flex-col sm:flex-row">
			<div class="flex items-center px-7 py-5 text-3xl justify-center sm:pr-0">
				<div class={"bg-orange rounded-full bg-slate-900 p-5 " + iconClasses}>
					<Icon />
				</div>
			</div>
			<div class="m-7 mt-0 sm:mt-7 text-center sm:text-left">
				<h3 class="mb-2 text-3xl">{title}</h3>
				<p
					class="mx-auto mb-2 max-w-fit truncate rounded-full border-1 bg-green-300/10 px-2 text-green-300 sm:mx-0"
				>
					{subtitle}
				</p>
				<div class="font-electrolize text-lg text-sky-600">
					{@render children()}
				</div>
			</div>
		</div>
	</div>
</section>
