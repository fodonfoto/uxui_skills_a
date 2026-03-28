# DESIGN.md

## Overview

A premium fintech interface defined by **"Dark Precision"** — inspired by the tactile experience of a high-end vault: secure, minimal, and mechanically exact.

The UI should feel:

* Calm, not frantic
* Precise, not decorative
* Confident, not loud

Avoid generic SaaS visuals. Every surface, spacing, and type decision must reinforce **trust, control, and clarity**.

---

## Design Principles

### 1. Dark Precision

Interfaces should feel engineered, not styled. Every element has intention.

### 2. Tonal Hierarchy (No Lines)

Never rely on borders. Depth and separation must come from layered surfaces.

### 3. Editorial Layout

Avoid overly symmetrical layouts. Use asymmetry and offset spacing to create a premium feel.

### 4. Functional Minimalism

Remove all non-essential UI. Prioritize signal over noise.

### 5. High-Contrast Readability

Typography must be extremely legible in low-light environments.

---

## Colors

### Core Palette

* **Primary (#FFB780)** → Highlight, gradient start, emphasis
* **Primary Container (#F58A24)** → Primary CTA, active states
* **Secondary (#6074b9)** → Supporting UI
* **Tertiary (#bd3800)** → Status / accent signals
* **Neutral (#757681)** → Muted text, secondary surfaces

---

### Surface System (CRITICAL)

Design must follow **layered surfaces instead of borders**

* `surface` (#121416) → Base background
* `surface_container_lowest` (#0C0E10) → Inputs / wells
* `surface_container` (#1E2022) → Cards
* `surface_container_highest` (#333537) → Modals / overlays

👉 Rule:
Each nested layer MUST shift tone (lighter or darker)

---

### Rules

* ❌ No 1px borders
* ❌ No pure black (#000000)
* ❌ No bright/neon colors
* ✅ Use contrast via surfaces
* ✅ Use orange ONLY for actions

---

### Effects

#### Glassmorphism (Floating UI only)

* 80% opacity surface
* 20px backdrop blur

#### Primary CTA Gradient

* Linear gradient (135deg)
* From `primary` → `primary_container`

---

## Typography

### Font Roles

* **Ledger (Space Grotesk)**
  → Numbers, balances, key metrics

* **Guide (Anuphan / Be Vietnam Pro)**
  → UI text, labels, descriptions

---

### Type Scale

* Display LG → 3.5rem (balances)
* Headline MD → 1.75rem
* Title MD → 1.125rem
* Body MD → 0.875rem
* Label SM → 0.6875rem

---

### Rules

* Numbers MUST use Space Grotesk
* Avoid mixing fonts within same component
* Maintain strong hierarchy (size + weight)
* Keep text concise and functional

---

## Spacing & Layout

### Spacing Scale

4, 8, 12, 16, 24, 32, 48, 64

---

### Layout Rules

* Prefer asymmetry over centered layouts
* Use large spacing (32px+) between sections
* Internal spacing must be tighter than external spacing

---

### Grid

* Desktop: 12 columns
* Tablet: 8 columns
* Mobile: 4 columns

---

## Elevation & Depth

### Tonal Layering (Primary Method)

Depth = stacking surfaces
NOT shadows

---

### Shadow (Rare Usage)

* Blur: 40px
* Opacity: 6%
* Color: tinted surface (NOT black)

---

### Ghost Border (Fallback Only)

* Use `outline_variant` at 15–20% opacity
* Never use solid borders

---

## Components

### Buttons

* Radius: **18px**

#### Primary

* Gradient fill
* Used for main actions ONLY

#### Secondary

* Surface-based fill

#### Tertiary

* No background (text button)

---

### Cards

* Radius: **20px**
* No borders
* Use spacing or surface shift for separation

---

### Lists

* No dividers
* Use spacing (24–32px)
* Icons inside soft container blocks

---

### Inputs

* Default: `surface_container_lowest`
* Focus:

  * Shift to `surface_container_high`
  * Add subtle primary glow (30% opacity)

---

### Signature Component: Vault Status Chip

* Background: `surface_variant`
* Border: outline_variant (low opacity)
* Add glowing status dot

---

## Interaction

### Motion

* Duration: 150–300ms
* Easing: ease-in-out
* Keep motion subtle and purposeful

---

### Feedback

* Hover → slight tonal shift
* Active → deeper surface
* Focus → glow (not outline-heavy)

---

## Accessibility

* Maintain readable contrast in dark mode
* Do not rely on color alone for status
* Ensure tap targets are large and clear

---

## Do / Don’t

### Do

* Use tonal depth instead of lines
* Use asymmetry for premium feel
* Use large spacing generously
* Keep UI calm and controlled

---

### Don’t

* Don’t use pure black
* Don’t use divider lines
* Don’t overuse color
* Don’t create visual noise

---

## Notes

This system is designed to produce a **luxury fintech experience** that feels:

* Secure
* Intentional
* Timeless

Every UI decision should reinforce **trust and precision**.
