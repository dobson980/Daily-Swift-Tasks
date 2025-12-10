# README Authoring Guidelines for Daily-Swift-Tasks

These guidelines define the preferred style and structure for README files in this repository. Future agents should follow this when creating or updating project READMEs so they stay consistent.

## 1. Overall Goals

- Each README should briefly explain **what** the project demonstrates and **how** to run it.
- Assume the reader knows basic Swift and Xcode, but not the specific SwiftUI technique used.
- Keep tone friendly, clear, and focused on learning.

## 2. File Naming and Scope

- Each project folder (for example `ActivityIndicator/`, `SwiftStock/`) should have a `README.md` at the **project root** (sibling to the `.xcodeproj`).
- The README describes **only that specific demo app**, not the entire repo.

## 3. Recommended Section Order

Follow this order unless there’s a strong reason to deviate:

1. `# ProjectName`
2. (Optional) One-line summary
3. **Overview**
4. **Screenshot** (image)
5. **Features**
6. **Code Breakdown** (if relevant)
7. **How to Run**
8. **Notes** or **Error Handling** / **Limitations**
9. (Optional) **Project Structure** / **Technologies Used** / **Usage**
10. Closing line linking it to the Daily Swift Tasks journey

### 3.1 Title

- Use a level-1 heading with the exact project name:
	- `# ActivityIndicator`
	- `# SwiftStock`
- On the next line, you MAY include a short, plain-text summary if the rest of the README doesn’t immediately do this.

### 3.2 Overview Section

- Use a level-2 heading:
	- `## Overview`
- Content:
	- 1–3 sentences.
	- Mention the core SwiftUI concept or pattern being demonstrated.
	- Use **bold** for the project name on first mention, for example: `**ActivityIndicator** is a SwiftUI project demonstrating …`.

### 3.3 Screenshot

- Prefer placing a single screenshot immediately after **Overview**.
- Use GitHub-hosted images via Markdown:
	- `![ActivityIndicator](https://github.com/user-attachments/assets/...)`
- Alt text should match the project name where possible.

### 3.4 Features Section

- Use a level-2 heading:
	- `## Features`
- Use a simple bullet list; short, clear points.
- Call out:
	- Key SwiftUI patterns (`@State`, `@Binding`, `List`, `NavigationStack`, `withAnimation`, etc.).
	- Notable behavior (animations, gestures, search, network calls).
	- Any reusable components.
- Emojis are optional; if used, keep them minimal and consistent with existing READMEs (for example, `🔍` for search, `📊` for data, `✨` for fancy UI).

### 3.5 Code Breakdown Section (Optional but Encouraged)

- Use a level-2 heading:
	- `## Code Breakdown`
- Use level-3 subsections with short, descriptive titles, optionally with emojis such as:
	- `### 🔄 Managing Loading State`
	- `### 🏗️ Structuring the ContentView`
	- `### 📌 Implementing the Bottom Sheet`
- For each subsection:
	- Add 1–2 sentences describing the idea.
	- Follow with a short code block (Swift fenced code) that highlights the key pattern.
	- Keep code snippets focused: avoid pasting entire files unless necessary.

### 3.6 How to Run Section

- Use a level-2 heading:
	- `## How to Run`
- Provide simple, numbered steps, tailored to Xcode:
	1. `Open **ProjectName.xcodeproj** in Xcode.`
	2. `Select an iOS simulator or device.`
	3. `Run the project (Cmd + R) and …` (describe what the user should do or observe).
- If extra setup is required (for example, API keys, entitlements), add a short subsection under **How to Run** or a separate **Setup** section.

### 3.7 Notes / Error Handling / Limitations

- Use whichever heading is most appropriate:
	- `## Notes`
	- `## Error Handling`
	- `## Limitations`
- Use bullets or short paragraphs.
- Good content here includes:
	- Important behavior details (for example, animations repeat indefinitely, search is case-insensitive).
	- Known constraints (for example, requires an external API key, iOS version requirements).
	- Anything surprising a learner should know.

### 3.8 Project Structure / Technologies Used / Usage (Optional)

- For more complex demos (for example, `SwiftStock`, `AnimatedAsyncButton`), you MAY add extra sections:
	- `## Project Structure` — often expressed as a table listing files and purposes.
	- `## Technologies Used` — bullet list of key technologies (`SwiftUI`, `Async/Await`, `URLSession`, etc.).
	- `## Usage` — a short walkthrough of main user interactions.
- Keep these concise and focused on learning.

### 3.9 Closing Line

- End with a short horizontal rule and tagline to tie back to the learning series.
- Preferred pattern:

	```markdown
	---
	🚀 *Part of the Daily Swift Tasks learning journey!*
	```

- Variations like Built as part of the Daily Swift Tasks learning journey. are acceptable but should remain consistent in style.

## 4. Formatting Conventions

- Use GitHub-flavored Markdown.
- Prefer:
	- Max 2–3 sentences per paragraph.
	- Bullet lists for features and notes.
	- Backticks for code identifiers (for example, `@State`, `ContentView`).
	- Fenced code blocks with language hints (` ```swift `, ` ```xml `) as in existing READMEs.
- Headings:
	- Use `#` for the main title.
	- Use `##` for major sections.
	- Use `###` for subsections inside **Code Breakdown** or similar.
- Tone:
	- Informative, concise, and slightly enthusiastic.
	- Avoid first-person unless crediting the author at the end.

## 5. Special Cases

- **API-based demos** (for example, `SwiftStock`):
	- Include a clear Setup or Set Up Your API Key subsection with numbered steps.
	- Show configuration snippets (for example, `APIKeys.plist` XML) in fenced code blocks.
- **Component libraries or reusable views**:
	- Emphasize reusability in **Features**.
	- Show how to integrate the component (brief `Usage` subsection).
- **Animation-heavy demos**:
	- Call out the key animation APIs in **Features** and show one representative snippet in **Code Breakdown**.

## 6. Checklist for New READMEs

When generating a new `README.md` for a project in this repo, an agent should ensure:

- [ ] Title is `# ProjectName` and matches the folder/app name.
- [ ] `## Overview` explains the main SwiftUI concept in 1–3 sentences.
- [ ] A screenshot image (if available) is included near the top.
- [ ] `## Features` list exists and calls out main behaviors and patterns.
- [ ] `## Code Breakdown` (with 2–4 subsections) exists for non-trivial examples.
- [ ] `## How to Run` includes Xcode steps and any required setup.
- [ ] A `## Notes` / `## Error Handling` / `## Limitations` section exists if there are caveats.
- [ ] Optional sections like `## Project Structure` or `## Technologies Used` are added for more complex projects.
- [ ] README ends with the Daily Swift Tasks tagline block.

Following these conventions will keep all project READMEs aligned with the current style while leaving room for project-specific details.

## 7. Commenting Guidelines for Swift Files

This repository is designed for learning Swift and SwiftUI, so source comments should actively teach. When adding comments to new projects, follow these principles:

### 7.1 Overall Goals

- Explain **why** something is done, not just **what** the code literally does.
- Call out the **SwiftUI concept** being demonstrated (for example, implicit vs. explicit animations, state management, view composition).
- Keep comments concise but friendly, assuming the reader knows basic Swift syntax but may be new to the specific pattern.

### 7.2 Where to Comment

- **App entry point (`App` conformances):**
	- Add a brief doc comment explaining the purpose of the app and what the root view shows.
	- Example from `withAnimation_vs_animationApp`:

		```swift
		/// Entry point for the **withAnimation_vs_animation** demo app.
		///
		/// This app is intentionally small and focused. Its only job is to
		/// launch `ContentView`, which contains the side‑by‑side comparison
		/// of the two animation approaches.
		@main
		struct withAnimation_vs_animationApp: App { ... }
		```

- **Main container views (for example, `ContentView`):**
	- Use a doc comment to describe the overall layout and what the user can experiment with.
	- Inline comments for major sections (tabs, navigation, key layout containers) describing their role.

- **State and bindings (`@State`, `@Binding`, `@ObservedObject`, etc.):**
	- Add short comments that describe what behavior the state drives.
	- Focus on how changing the value affects the UI or animation.

- **Key demo views:**
	- Add a top-level doc comment explaining the **specific concept** the view demonstrates (for example, using `.animation(_:, value:)` vs. `withAnimation(_:_:)`).
	- Use a few targeted inline comments on the most important modifiers or closures, not every line.

- **Previews:**
	- Add a brief comment indicating what the preview is useful for (for example, "Preview for experimenting with the implicit animation approach.").

### 7.3 Comment Style

- Prefer **doc comments** (`///`) for types, properties, and top-level explanations.
- Use **inline comments** (`//`) sparingly to:
	- Separate logical sections inside a view body.
	- Explain surprising or non-obvious choices.
	- Highlight where a particular SwiftUI behavior is triggered (for example, where an animation is attached).
- Keep comments **high signal**:
	- Avoid restating the obvious (for example, `// This is a VStack` is not helpful).
	- Do explain concepts (`// Implicit animation: SwiftUI animates from the old width to the new width using this easing curve.`).

### 7.4 Tone and Audience

- Assume the reader is a **learner** exploring SwiftUI demos.
- Use positive, encouraging language and focus on what they can observe or tweak.
- Write in the third person, except when briefly addressing the reader (for example, "Here you can see…").

### 7.5 Example: Animation Demo

When documenting an animation-focused view (like `AnimatedView` / `WithAnimation`):

- At the **struct level**, explain what animation technique is being demonstrated.
- For the **state property**, mention how toggling it affects the UI.
- On the **core animated views**, add a comment that ties the modifier to the behavior the learner will see.
- Around **buttons or interaction points**, clarify whether the animation is declared on the view (`.animation`) or around the state change (`withAnimation`).

Example snippet inspired by `AnimatedView`:

```swift
/// Demonstrates using the `.animation(_:, value:)` view modifier.
///
/// Here each `Rectangle` has an animation attached directly to it.
/// Whenever `smallViews` changes, SwiftUI implicitly animates the
/// affected properties (the width in this case) to their new values.
struct AnimatedView: View {

		/// Tracks whether the rectangles should be "small" or "large".
		///
		/// Toggling this value drives the width change that we animate.
		@State private var smallViews: Bool = true

		var body: some View {
				VStack {
						// Red rectangle that animates its width when `smallViews` changes.
						Rectangle()
								.fill(.red)
								.frame(width: smallViews ? 200 : 100, height: 100)
								// Implicit animation: SwiftUI animates from the old
								// width to the new width using this easing curve.
								.animation(.easeInOut, value: smallViews)
						// ...
				}
		}
}
```

### 7.6 Checklist for Commenting a New Demo

When adding comments to a new SwiftUI demo in this repo, ensure:

- [ ] The app entry point has a short doc comment explaining what the demo shows.
- [ ] The main view (usually `ContentView`) has a doc comment summarizing the layout and learning goal.
- [ ] Important state properties are documented with how they affect the UI/behavior.
- [ ] Key demo views (animation, layout, networking, etc.) have high-level doc comments plus a few targeted inline comments.
- [ ] Previews include a brief note about what they are useful for.
- [ ] Comments focus on teaching concepts rather than narrating obvious syntax.
