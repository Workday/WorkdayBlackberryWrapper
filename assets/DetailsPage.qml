/*
 * Copyright (c) 2011-2013 BlackBerry Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bb.cascades 1.2

Page {
    property bool serverValid: true
    id: page
    
    titleBar: TitleBar {
        title: "Server settings"
    }
    
    Container {
        layout: StackLayout {
        }
        topPadding: 30
        leftPadding: 30
        rightPadding: 30
        bottomPadding: 30
        
        Label {
            text: "Server name"
        }
        TextField {
            id: serverName
            objectName: "serverName"
            text: _app.getValueFor(serverName.objectName, "wd3-impl.workday.com")
            hintText: "Input server name"
            maximumLength: 200
            onTextChanging: {
                page.serverValid = false;
            }
            autoFit: TextAutoFit.FitToBounds
            inputMode: TextFieldInputMode.Url
            
            /* validator: Validator {
             id: addressValidator
             state: ValidationState.Valid
             mode: ValidationMode.Custom
             
             errorMessage: "Valid server not reachable at that address"
             onValidate: {
             state = ValidationState.InProgress
             
             //to do
             xxx.validateServer(serverAddress.text); 
             }
             } */
        
        }
        Label {
            text: "Tenant name"
        }
        TextField {
            id: tenantName
            objectName: "tenantName"
            text: _app.getValueFor(tenantName.objectName, "BB4")
            hintText: "Input tenant name"
            maximumLength: 200
            onTextChanging: {
                page.serverValid = false;
            }
            autoFit: TextAutoFit.FitToBounds   
            inputMode: TextFieldInputMode.Url    
        }      
        Container {
            horizontalAlignment: HorizontalAlignment.Center
            topPadding: 30
            Button {
                topPadding: 30
                leftPadding: 30
                text: "Save settings"
                onClicked: {
                    _app.saveValueFor(tenantName.objectName, tenantName.text);
                    _app.saveValueFor(serverName.objectName, serverName.text);
                    //activityIndicator.running = true;
                    //addressValidator.validate();
                }
            
            }
        
        }
    }
}