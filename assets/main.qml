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

NavigationPane {
    id: navigationPane

    function buildUrl() {
        if (_app.getValueFor('serverName', "") == 0) {
            //return "https://m.myworkday.com";
            return "https://www.myworkday.com/m.htm";
        } else {
            return "https://" + _app.getValueFor('serverName', '') + "/" + _app.getValueFor('tenantName', '') + "/t";
        
        }
    }
    
    Menu.definition: MenuDefinition {
        
        // Add a Settings action
        settingsAction: SettingsActionItem {
            onTriggered: {
                //ToDo
                Application.menuEnabled = false;
                navigationPane.push(secondPageDefinition.createObject());
            }
        }
    }
    
    Page {
        
        ScrollView {
            
            Container {
                background: Color.create ("#f8f8f8")
                layout: StackLayout {
                    orientation: LayoutOrientation.TopToBottom
                }
                WebView {
                    
                    id: wdWebView
                    url: buildUrl();                  
                    settings.defaultTextCodecName: "UTF-8"
                    settings.credentialAutoFillEnabled: true
                    
                }
            }
        }
    }

    attachedObjects: [
        // Definition of the second Page, used to dynamically create the Page above.
        ComponentDefinition {
            id: secondPageDefinition
            source: "DetailsPage.qml"
        }
    ]

    onPopTransitionEnded: {
        // Destroy the popped Page once the back transition has ended.
        page.destroy();
        Application.menuEnabled = true;
        //console.log(buildUrl());
        //console.log(wdWebView.url);
        if (wdWebView.url != buildUrl()) {
            wdWebView.url = buildUrl();
        }
    }
}
