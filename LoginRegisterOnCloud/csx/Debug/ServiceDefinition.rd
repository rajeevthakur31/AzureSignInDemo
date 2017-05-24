<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="LoginRegisterOnCloud" generation="1" functional="0" release="0" Id="3466a987-fec8-4de2-90b4-033b18ef8efd" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="LoginRegisterOnCloudGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="MvcWebRole1:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/LoginRegisterOnCloud/LoginRegisterOnCloudGroup/LB:MvcWebRole1:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="MvcWebRole1:StorageConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/LoginRegisterOnCloud/LoginRegisterOnCloudGroup/MapMvcWebRole1:StorageConnectionString" />
          </maps>
        </aCS>
        <aCS name="MvcWebRole1Instances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/LoginRegisterOnCloud/LoginRegisterOnCloudGroup/MapMvcWebRole1Instances" />
          </maps>
        </aCS>
        <aCS name="WorkerRole1:StorageConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/LoginRegisterOnCloud/LoginRegisterOnCloudGroup/MapWorkerRole1:StorageConnectionString" />
          </maps>
        </aCS>
        <aCS name="WorkerRole1Instances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/LoginRegisterOnCloud/LoginRegisterOnCloudGroup/MapWorkerRole1Instances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:MvcWebRole1:Endpoint1">
          <toPorts>
            <inPortMoniker name="/LoginRegisterOnCloud/LoginRegisterOnCloudGroup/MvcWebRole1/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapMvcWebRole1:StorageConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/LoginRegisterOnCloud/LoginRegisterOnCloudGroup/MvcWebRole1/StorageConnectionString" />
          </setting>
        </map>
        <map name="MapMvcWebRole1Instances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/LoginRegisterOnCloud/LoginRegisterOnCloudGroup/MvcWebRole1Instances" />
          </setting>
        </map>
        <map name="MapWorkerRole1:StorageConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/LoginRegisterOnCloud/LoginRegisterOnCloudGroup/WorkerRole1/StorageConnectionString" />
          </setting>
        </map>
        <map name="MapWorkerRole1Instances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/LoginRegisterOnCloud/LoginRegisterOnCloudGroup/WorkerRole1Instances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="MvcWebRole1" generation="1" functional="0" release="0" software="D:\RAJEEV\Projects\LoginRegisterOnCloud\LoginRegisterOnCloud\csx\Debug\roles\MvcWebRole1" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="-1" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="StorageConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;MvcWebRole1&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;MvcWebRole1&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;r name=&quot;WorkerRole1&quot; /&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/LoginRegisterOnCloud/LoginRegisterOnCloudGroup/MvcWebRole1Instances" />
            <sCSPolicyUpdateDomainMoniker name="/LoginRegisterOnCloud/LoginRegisterOnCloudGroup/MvcWebRole1UpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/LoginRegisterOnCloud/LoginRegisterOnCloudGroup/MvcWebRole1FaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
        <groupHascomponents>
          <role name="WorkerRole1" generation="1" functional="0" release="0" software="D:\RAJEEV\Projects\LoginRegisterOnCloud\LoginRegisterOnCloud\csx\Debug\roles\WorkerRole1" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaWorkerHost.exe " memIndex="-1" hostingEnvironment="consoleroleadmin" hostingEnvironmentVersion="2">
            <settings>
              <aCS name="StorageConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;WorkerRole1&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;MvcWebRole1&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;r name=&quot;WorkerRole1&quot; /&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/LoginRegisterOnCloud/LoginRegisterOnCloudGroup/WorkerRole1Instances" />
            <sCSPolicyUpdateDomainMoniker name="/LoginRegisterOnCloud/LoginRegisterOnCloudGroup/WorkerRole1UpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/LoginRegisterOnCloud/LoginRegisterOnCloudGroup/WorkerRole1FaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="MvcWebRole1UpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyUpdateDomain name="WorkerRole1UpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="MvcWebRole1FaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyFaultDomain name="WorkerRole1FaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="MvcWebRole1Instances" defaultPolicy="[1,1,1]" />
        <sCSPolicyID name="WorkerRole1Instances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="76c634de-381c-40a3-889c-25ce789b2686" ref="Microsoft.RedDog.Contract\ServiceContract\LoginRegisterOnCloudContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="b4ab9591-27db-457b-b203-762cfb5b8998" ref="Microsoft.RedDog.Contract\Interface\MvcWebRole1:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/LoginRegisterOnCloud/LoginRegisterOnCloudGroup/MvcWebRole1:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>