---
stepsCompleted: ["step-01-init", "step-02-discovery", "step-02b-vision", "step-02c-executive-summary", "step-03-success", "step-04-journeys"]
inputDocuments: ["readme.md", "docker-compose.yml", "backend/app/main.py", "infra/terraform/main.tf"]
workflowType: 'prd'
documentCounts: {briefCount: 0, researchCount: 0, brainstormingCount: 0, projectDocsCount: 4}
classification:
  projectType: saas_b2b
  domain: retail_fnb
  complexity: medium
  projectContext: brownfield
---

# Product Requirements Document - lite-erp-platform

**Author:** Vitor
**Date:** 2026-03-19

## Executive Summary

The **Lite ERP Platform** is a high-velocity, real-time Operating System designed specifically for kiosks and snack bars. It addresses the critical operational bottleneck of manual order handoff between front-of-house (cashier) and back-of-house (kitchen) during peak "rush hour" periods. By providing a seamless digital bridge for order propagation, the platform reduces human error, diminishes operational friction, and accelerates service speed for the end customer. Beyond feature delivery, the project serves as a demonstration of production-grade operational excellence, incorporating observability, CI/CD, and a stateless architecture prepared for future Kubernetes scaling.

### What Makes This Special

The core differentiator is the **"Cashier-to-Cook" Direct Link**. Unlike bloated traditional ERPs that focus on retroactive reporting, Lite ERP prioritizes **Instantaneous Information Flow**. The moment an order is finalized by the tenant, it is pushed via low-latency WebSockets directly to the kitchen display, eliminating the need for physical tickets or verbal communication. This "less human touch" approach allows small-footprint operations to achieve the same throughput as major fast-food chains. Furthermore, it provides the shop owner with a real-time "God-view" dashboard of active shop operations, providing visibility that paper-based systems cannot offer.

## Project Classification

- **Project Type:** SaaS B2B Platform (Multi-tenant)
- **Domain:** Retail Food & Beverage (Kiosk/Snack Bar ERP)
- **Complexity Level:** Medium (Multi-tenant isolation + Real-time WebSocket synchronization)
- **Project Context:** Brownfield (Built on an existing FastAPI/MongoDB/React/Terraform foundation)

## Success Criteria

### User Success
The Kiosk Owner and Staff measure success by the **Direct-to-Kitchen Synchronization**. The system is successful when the "handoff" between the front-of-house and back-of-house is silent, fast, and digital.
*   **The "Aha!" Moment:** Seeing an order and its components immediately displayed on the Kitchen Display System (KDS) upon cashier check-out.
*   **The "Relief" Moment:** The kitchen never has to shout a question back to the cashier because the digital ticket is perfectly clear.

### Business Success
For the Lite ERP operator, success is measured by the **Demonstrability of a Production System**.
*   **Operational Integrity:** The system is live, observable via Grafana/Prometheus, and can be maintained through a automated CI/CD pipeline.
*   **Infrastructure Readiness:** The backend is fully stateless and ready for horizontal scaling or a future shift to Kubernetes.

### Technical Success
*   **Propagation Latency:** **< 1.0 second** from Order Completion to Kitchen Display update (via WebSockets).
*   **System Availability:** **99.9% uptime** during operational hours.
*   **Observability Coverage:** 100% of API endpoints and WebSocket events are traced and logged.

### Measurable Outcomes
*   **Reduced Friction:** Minimal manual interaction between cashier and cook (measured by verbal interruptions).
*   **Owner Visibility:** Real-time access to "Total Sales Today" and "Active Preparations" from a remote dashboard.

## Product Scope

### MVP - Minimum Viable Product
*   **Tenant Authentication:** User registration/login for shop owners (JWT-based).
*   **Menu Management:** CRUD operations for products (name, price, category, stock).
*   **Cashier Interface:** A fast, transactional UI for order entry.
*   **Kitchen Display System (KDS):** A real-time, WebSocket-powered queue showing "Pending," "Preparing," and "Done" statuses.
*   **Basic Summary Dashboard:** Total revenue and active order count for the current day.

### Growth Features (Post-MVP)
*   **Customer Loyalty:** Basic registration/order history for the consumer.
*   **Advanced Analytics:** Day-over-day sales trends and prep-time averages.
*   **Inventory Alerts:** Low-stock notifications and supplier management.

### Vision (Future)
*   **Kubernetes Transition:** Automated scaling based on tenant load.
*   **AI Optimizations:** Predictive inventory ordering based on sales history.
*   **Global Multi-Shop:** A single owner managing multiple geographic franchises from a unified account.

## User Journeys

### 1. The "Rush Hour" Handoff (The Core "Hook")
**Personas:** **Thiago (Cashier)** & **Beto (Cook)**
*   **Opening Scene:** 12:15 PM. A line of five hungry customers has formed at the kiosk. In the old days, Thiago would be shouting orders and scribbling on greasy paper.
*   **Rising Action:** Thiago taps the big, high-contrast icons for an "X-Burger" and "Large Fries" on his tablet. He confirms the total and hits **"Place Order."**
*   **Climax:** In the kitchen, a high-pitched "Ding!" sounds. **Beto** sees the "X-Burger" ticket slide onto his digital queue instantly. No shouting, no confusion about the order details.
*   **Resolution:** Thiago is already greeting the next customer while Beto is flipping the burger. The customer gets their food 2 minutes faster than they used to.

### 2. The "Remote Manager" Peace of Mind
**Persona:** **Marcos (Shop Owner)**
*   **Opening Scene:** Marcos is at home on a rainy Tuesday. He’s worried that the rain is keeping customers away from his beach-side kiosk.
*   **Rising Action:** He pulls up the **Lite ERP Dashboard** on his phone.
*   **Climax:** He sees a real-time count: **12 active orders** and **$350 in revenue** so far today. He notices the "Average Prep Time" is holding steady at 4 minutes.
*   **Resolution:** He stops worrying. The dashboard gives him the "God-view" he needs to know the shop is operating perfectly without him being on-site.

### 3. The 10-Minute Launch (Onboarding)
**Persona:** **Marcos (Shop Owner)**
*   **Opening Scene:** Marcos just opened a second, smaller kiosk at the bus station. He needs to get it live *today*.
*   **Rising Action:** He signs up for a new account, quickly adds his five core menu items (Name, Price, Category), and sets up the stock counts.
*   **Climax:** He opens the browser on the new kiosk's tablet and logs in. He places a "Test Order" for a Soda.
*   **Resolution:** He sees the order pop up on his phone and the stock count decrement immediately. From registration to "Business Ready" in under 10 minutes.

### 4. The "Production Watch" (Operational Success)
**Persona:** **Vitor (The System Operator)**
*   **Opening Scene:** Vitor wants to prove the system is truly production-grade.
*   **Rising Action:** While multiple kiosks are hitting the API, he monitors the **Grafana Dashboard**.
*   **Climax:** He sees a slight spike in WebSocket latency. He checks the logs, identifies a small bottleneck in the database query, and pushes a fix through the **CI/CD pipeline**.
*   **Resolution:** He watches the latency graph drop back to sub-500ms in real-time. He's just demonstrated "Operational Excellence" by maintaining a live, high-speed system under load.

### Journey Requirements Summary
*   **Instant Notification System:** WebSockets required for the "Ding!" and the KDS queue update.
*   **Mobile-Optimized Dashboards:** For the owner's remote visibility on any device.
*   **Lean Onboarding Flow:** Minimized complexity to go from "Sign up" to "First Order."
*   **Stateless Backend:** To ensure Vitor can deploy fixes mid-rush without dropping WebSocket connections.
