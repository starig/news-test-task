---
name: flutter-feature-implementation
description: Use this skill when implementing or modifying Flutter features in this project. Apply for tasks involving screens, cubits, repositories, DTO/entity mapping, routing, API integration, and UI state handling. Do not use for infra-only tasks unrelated to Flutter feature code.
---

# Purpose

Implement Flutter features in this project according to the team architecture and coding standards.

# Project standards

- Write sound null-safe Dart code.
- Prefer clear, descriptive names for variables, methods, classes, and files.
- Never use 1-2 letter variable names except for trivial loop indices.
- Write clean production-ready code without decorative abstractions.
- Do not add excessive comments. Code should be self-explanatory.
- Avoid quick hacks that break architecture boundaries.

# Architecture rules

- Follow clean architecture.
- UI layer must not directly depend on Retrofit DTOs or raw API responses.
- Map DTO -> Entity in the data layer.
- Business decisions belong in domain/use case or cubit, not in widgets.
- Keep widgets focused on rendering and user interaction.
- Keep side effects out of build methods.
- Reuse existing project patterns before introducing new abstractions.

# State management rules (Mono State)

- Use a single immutable state class instead of multiple state subclasses.
- Do not create separate classes like LoadingState, SuccessState, ErrorState.
- Avoid sealed unions or multiple state hierarchies.
- The state must represent the full screen data at all times.

- Represent UI states using fields inside the state:
    - boolean flags (isLoading, isSaving, etc.)
    - nullable fields (data, errorMessage, etc.)
    - enums if needed for small scoped states

- Always update state via copyWith.
- State must be immutable.

- Preserve previous data when updating state:
    - do not clear existing data unless explicitly required
    - loading should not wipe already loaded content

- Prefer explicit fields over implicit state transitions.

- Derived values (computed properties) should be implemented as getters inside the state.

- Avoid splitting state across multiple cubits when it represents one logical screen.

# CopyWith rules

- Always update state via copyWith.
- Preserve existing values unless explicitly changed.
- Do not accidentally overwrite fields with null when null is a valid value.
- When a nullable field must support both "not provided" and "explicitly set to null", use a sentinel value pattern.

# Nullable field handling (sentinel pattern)

- When a field can be nullable and needs to be explicitly cleared, use a sentinel value pattern.
- Do not rely on `null` to distinguish between:
    - "value not provided"
    - "value explicitly set to null"

- Use a private sentinel constant inside the state:

  static const Object _notSpecified = Object();

- Use `Object?` parameters in copyWith for such fields.
- Use `identical(value, _notSpecified)` to detect untouched fields.
- Only cast to the expected type after the sentinel check.

- Do not replace this pattern with `??` or nullable parameters.
- Use this pattern only where null is a meaningful value.

# State design rules

- State should be easy to inspect at any moment.
- A developer should understand the entire screen state by looking at one object.
- Avoid hidden state transitions or implicit behavior.
- Favor clarity over theoretical purity.

# Immutable data rules

- Do not mutate collections inside state in place.
- Always create new instances when updating lists, sets, or maps.

# Cubit rules

- Cubit methods should reflect user actions or screen events.
- Prefer clear action-oriented method names.
- Keep cubit methods readable and sequential.
- Do not split simple flows into many single-use private helpers.
- Emit updated state intentionally and predictably.

# Method design rules

- Prefer local readability over aggressive method extraction.
- Do not split one coherent flow into many private helper methods if they are used only once.
- Do not extract methods only to reduce the number of lines in the original method.
- Keep related actions together when they are part of one sequential scenario.
- Extract a private method only when it introduces a meaningful abstraction, improves understanding, or is reused.
- Do not wrap trivial logic into helper methods.
- Optimize for how easily the code can be understood in one pass inside the editor.

# Networking and models

- Use Retrofit for API clients if the project already does so.
- Keep request/response models separated from domain entities.
- Handle nullable fields defensively.
- Do not leak transport-layer naming into UI if a domain name is clearer.
- If API contract is ambiguous, keep the mapping isolated and document assumptions concisely.

# UI rules

- Follow existing design system, theme, spacing, and component patterns.
- Avoid large widgets with mixed logic.
- Support loading, error, and empty states.
- Think about long text, keyboard overlap, scroll behavior, and small screens.

# Widget structure rules

- Do not create private widgets inside the same file.
- Avoid `_PrivateWidget` patterns.

- Each widget class must be placed in its own file.
- Do not group multiple widget classes in a single file.

- Prefer creating a new file in the same directory for extracted widgets.
- File names must use snake_case and match the widget name.

  Example:
  ChatHeader -> chat_header.dart

- Extract widgets into separate files even if they are used only once, as long as they represent a meaningful UI block.
- Do not create separate widget files for trivial layout fragments.

- Prefer explicit file structure over local encapsulation.

# Routing and navigation

- Use the existing router setup and naming conventions.
- Do not introduce a new navigation approach if the project already uses go_router.
- Preserve back navigation behavior and passed arguments.

# Method extraction anti-patterns

- Avoid methods where:
    - a public method only calls 3–5 private helpers
    - each helper is used once
    - helpers wrap trivial logic
    - understanding requires jumping between many methods

# State anti-patterns

- Do not create separate state classes like:
    - NameLoadingState
    - NameSuccessState
    - NameErrorState

- Do not model state as:
  sealed class NameState {}

- Do not replace the entire state with unrelated partial data.
- Do not drop previously loaded data during loading or error transitions.

# Widget anti-patterns

- Do not create private widgets like:
    - `_HeaderWidget`
    - `_MessageItem`
    - `_ChatTile`

- Do not hide UI structure inside large files.
- Do not keep multiple widget classes in a single file.

# Before finishing

- Check imports and naming consistency.
- Check null safety and edge cases.
- Ensure architecture layers are respected.
- Ensure code follows existing project structure.
- Summarize what was changed.
- Mention assumptions only if they were actually made.

## Naming exception (try-catch)

- In catch blocks, it is allowed to use short variable names like `e` for exceptions.
- This is an exception to the general rule about descriptive naming.

- Prefer the following pattern:

  try {
  // ...
  } catch (e, stackTrace) {
  // handle error
  }

- Do not rename `e` to `exception` or other longer names.
- Use `stackTrace` as the second parameter name when needed.

- This exception applies only to catch blocks.