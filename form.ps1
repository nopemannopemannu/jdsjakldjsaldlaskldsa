Add-Type -AssemblyName System.Windows.Forms

Add-Type -AssemblyName System.Drawing



Function Get-Details{



$Selection = $DropDownBox.SelectedItem.ToString()



if($Selection -eq "Service Details"){



$OutputBox.Text =  Get-Service | Out-String



}

elseif($Selection -eq "Process Details"){



$OutputBox.Text = Get-Process | Out-String



}

elseif($Selection -eq "Drive Details"){



$OutputBox.Text = Get-PSDrive | Out-String



}

}



$Form = New-Object System.Windows.Forms.Form

$Form.Size = New-Object System.Drawing.Size(600,400)






$DropDownBox = New-Object System.Windows.Forms.ComboBox

$DropDownBox.Location = New-Object System.Drawing.Size(20,50)

$DropDownBox.Size = New-Object System.Drawing.Size(180,20) 

$DropDownBox.Height = 200



$Form.Controls.Add($DropDownBox)



$Details = @("Service Details","Process Details","Drive Details")



foreach($Detail in $Details){



$DropDownBox.Items.Add($Detail)



}



$OutputBox = New-Object System.Windows.Forms.RichTextBox

$OutputBox.Location = New-Object System.Drawing.Size(10,150)

$OutputBox.Size = New-Object System.Drawing.Size(565,200)

$OutputBox.Multiline = $true



$OutputBox.ScrollBars = "Vertical"

$Form.Controls.Add($OutputBox)





$Button = New-Object System.Windows.Forms.Button

$Button.Location = New-Object System.Drawing.Size(400,30)

$Button.Size = New-Object System.Drawing.Size(80,50)

$Button.Text = "System Information"

$Button.Add_Click({Get-Details})

$Form.Controls.Add($Button)





[void]$Form.ShowDialog()