#
# OpenAPI Petstore
# This is a sample server Petstore server. For this sample, you can use the api key `special-key` to test the authorization filters.
# Version: 1.0.0
# Generated by OpenAPI Generator: https://openapi-generator.tech
#

<#
.SYNOPSIS

No summary available.

.DESCRIPTION

No description available.

.PARAMETER AdditionalMetadata
Additional data to pass to server

.PARAMETER File
file to upload

.OUTPUTS

InlineObject1<PSCustomObject>
#>

function Initialize-PSInlineObject1 {
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipelineByPropertyName = $true)]
        [String]
        ${AdditionalMetadata},
        [Parameter(Position = 1, ValueFromPipelineByPropertyName = $true)]
        [System.IO.FileInfo]
        ${File}
    )

    Process {
        'Creating PSCustomObject: PSPetstore => PSInlineObject1' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug

        $PSO = [PSCustomObject]@{
            "additionalMetadata" = ${AdditionalMetadata}
            "file" = ${File}
        }

        return $PSO
    }
}

<#
.SYNOPSIS

Convert from JSON to InlineObject1<PSCustomObject>

.DESCRIPTION

Convert from JSON to InlineObject1<PSCustomObject>

.PARAMETER Json

Json object

.OUTPUTS

InlineObject1<PSCustomObject>
#>
function ConvertFrom-PSJsonToInlineObject1 {
    Param(
        [AllowEmptyString()]
        [string]$Json
    )

    Process {
        'Converting JSON to PSCustomObject: PSPetstore => PSInlineObject1' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug

        $JsonParameters = ConvertFrom-Json -InputObject $Json

        # check if Json contains properties not defined in PSInlineObject1
        $AllProperties = ("additionalMetadata", "file")
        foreach ($name in $JsonParameters.PsObject.Properties.Name) {
            if (!($AllProperties.Contains($name))) {
                throw "Error! JSON key '$name' not found in the properties: $($AllProperties)"
            }
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "additionalMetadata"))) { #optional property not found
            $AdditionalMetadata = $null
        } else {
            $AdditionalMetadata = $JsonParameters.PSobject.Properties["additionalMetadata"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "file"))) { #optional property not found
            $File = $null
        } else {
            $File = $JsonParameters.PSobject.Properties["file"].value
        }

        $PSO = [PSCustomObject]@{
            "additionalMetadata" = ${AdditionalMetadata}
            "file" = ${File}
        }

        return $PSO
    }

}

