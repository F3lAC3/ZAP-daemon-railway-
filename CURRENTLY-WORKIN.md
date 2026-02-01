CURRENTLY-WORKIN.md

## Notes!

Based on the content of the websites you have open—specifically the **OWASP ZAP** documentation and the **Jit.io** resources—the clear technology choice for **standardpentest.com** to run cost-effective, automated, and compliance-focused scans in temporary containers is **OWASP ZAP (Zed Attack Proxy) running via Docker**.

Here is a breakdown of why this is the optimal choice and how to implement it based on your research tabs:

### 1. The Core Engine: OWASP ZAP Docker Images

To meet your goal of "lowering the price tag" and running "temporary containers," ZAP's official Docker support is the foundational piece.

- **Source:** [ZAP Docker Documentation](https://www.zaproxy.org/docs/docker/)
- **Why it fits:** ZAP provides pre-packaged Docker images (e.g., `owasp/zap2docker-stable`) that can be spun up on-demand to run a scan and then terminated immediately. This fits your need for "temporary containers" perfectly.
- **Implementation:** You can programmatically instantiate these containers for each client request. The docs highlight three main execution modes you can wrap your service around:
- **Baseline Scan:** A quick time-limited spider for finding obvious issues (good for a "free tier" or fast check).
- **Full Scan:** Includes the full spider, Ajax spider, and active scanning (ideal for your "Enterprise-grade" paid audits).
- **API Scan:** Specifically for scanning APIs defined by OpenAPI/Swagger, which is critical for modern SaaS compliance.

### 2. Handling Modern Web Apps: The Automation Framework & Ajax Spider

To achieve the "new paradigm" and ensure you aren't missing content in modern React/Vue/Angular apps, you must go beyond simple crawling.

- **Source:** [ZAP – Ajax Spider Automation Framework Support](https://www.zaproxy.org/docs/desktop/addons/ajax-spider/automation/)
- **Why it fits:** The **Ajax Spider** uses a headless browser to crawl applications that rely heavily on JavaScript.
- **Implementation:** Use the **ZAP Automation Framework**. Instead of complex CLI flags, you can pass a YAML configuration file to the Docker container defining exactly how the `spiderAjax` job should run (e.g., specific browsers, depth, click rules). This ensures consistency ("Standardized Methodology") across every audit.

### 3. Compliance Alignment: Mapping ZAP to Audit Requirements

Your project aims to help IT directors preparing for compliance audits (like SOC 2).

- **Source:** [SOC 2 Compliance Checklist](https://www.jit.io/resources/security-standards/soc-2-compliance-checklist) and [How to Test Permissions Policy Header](https://www.jit.io/resources/owasp-zap/how-to-test-permissions-policy-header-configuration-with-zap)
- **Why it fits:** The resources show that ZAP scans directly map to compliance controls. For example, ZAP can automatically test for **Permissions Policy Headers** and **API vulnerabilities**, which are key technical evidence for SOC 2 security criteria.
- **Implementation:** You can configure ZAP's active scan rules to target specific compliance failures (e.g., missing headers, weak encryption) and generate reports that an IT Director can hand directly to an auditor.

### Summary Recommendation for standardpentest.com

To build your standardized, low-cost platform:

1. **Backend:** Orchestrate **OWASP ZAP Docker containers** (`owasp/zap2docker-stable`).
2. **Configuration:** Use the **Automation Framework (YAML)** to define standardized scan profiles (e.g., "Compliance Scan" vs. "Deep Pen Test").
3. **Engine:** Enable the **Ajax Spider** for all web app scans to ensure you capture modern single-page applications.
4. **Reporting:** Parse the ZAP XML/JSON reports to generate your "Clear Reporting" and "Compliance Ready" attestation letters.
