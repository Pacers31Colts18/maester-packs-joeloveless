#### Description

CIS Microsoft Intune for Windows 11 Benchmark, recommendation 50.1 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Local Security Authority > Configure Lsa Protected Process** to **Enabled with UEFI lock. LSA will run as protected process and this configuration is UEFI locked.**, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Local Security Authority** > **Configure Lsa Protected Process** and set it to **Enabled with UEFI lock. LSA will run as protected process and this configuration is UEFI locked.**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/windows/client-management/mdm/policy-csp-LocalSecurityAuthority#configurelsaprotectedprocess)

<!--- Results --->
%TestResult%
