#### Description

CIS Microsoft Intune for Windows 11 Benchmark, recommendation 6.21 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Auditing > Policy Change Audit MPSSVC Rule Level Policy Change** to **Success+ Failure**, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Auditing** > **Policy Change Audit MPSSVC Rule Level Policy Change** and set it to **Success+ Failure**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/windows/client-management/mdm/policy-csp-Audit#policychange_auditmpssvcrulelevelpolicychange)

<!--- Results --->
%TestResult%
