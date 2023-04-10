describe "ImplementationGuide resource" do

    before :each do
        @file = 'input/resources/ImplementationGuide/fhir.ig.experiment.01.xml'
    end

    it 'exists' do
        # custom matcher :exist
        expect(@file).to exist
    end

    it "has root element 'ImplementationGuide'" do
        expect(@file).to have_root_element("ImplementationGuide")
    end

    context '1) metadata:' do

        context 'ImplementationGuide.id' do
            it "has value 'fhir.ig.experiment.01'" do
                expect(@file).to have_element_with_value("ImplementationGuide.id", "fhir.ig.experiment.01")
            end
        end

        context 'ImplementationGuide.url' do        
            it "has value 'https://about.me/robeastwood/fhir/ig/ImplementationGuide/fhir.ig.experiment.01'" do
                expect(@file).to have_element_with_value("ImplementationGuide.url", "https://about.me/robeastwood/fhir/ig/ImplementationGuide/fhir.ig.experiment.01")
            end
        end

        context 'ImplementationGuide.identifier' do        
            it "is not present" do
                expect(@file).not_to have_element("ImplementationGuide.identifier")
            end
        end

        context 'ImplementationGuide.version' do
            # it "has value '0.0.1'" do
            #     expect(@file).to have_element_with_value("ImplementationGuide.version", "0.0.1")
            # end
            it 'conforms to SemVer rules' do
                expect(@file).to have_element_with_value_matching_semver_rules("ImplementationGuide.version")
            end
        end

        context 'ImplementationGuide.name' do        
            it "has value 'FHIRIGExperiment01'" do
                expect(@file).to have_element_with_value("ImplementationGuide.name", "FHIRIGExperiment01")
            end
        end

        context 'ImplementationGuide.title' do        
            it "has value 'FHIR Implementation Guide Experiment 01'" do
                expect(@file).to have_element_with_value("ImplementationGuide.title", "FHIR Implementation Guide Experiment 01")
            end
        end

        context 'ImplementationGuide.status' do        
            it "has value 'draft'" do
                expect(@file).to have_element_with_value("ImplementationGuide.status", "draft")
            end
        end

        context 'ImplementationGuide.experimental' do        
            it "has value 'true'" do
                expect(@file).to have_element_with_value("ImplementationGuide.experimental", "true")
            end
        end

        context 'ImplementationGuide.date' do        
            it "is present" do
                expect(@file).to have_element("ImplementationGuide.date")
            end
        end

        context 'ImplementationGuide.publisher' do        
            it "has value 'Rob Eastwood (himself)'" do
                expect(@file).to have_element_with_value("ImplementationGuide.publisher", "Rob Eastwood (himself)")
            end
        end

        context "ImplementationGuide.contact" do
            it "is present once" do
                expect(@file).to have_one_of_node("ImplementationGuide.contact")
            end
            it ".name is not present" do
                expect(@file).not_to have_element("ImplementationGuide.contact.name")
            end
            it ".telecom is present once" do
                expect(@file).to have_one_of_node("ImplementationGuide.contact.telecom")
            end
            it ".telecom.system has value 'url'" do
                expect(@file).to have_element_with_value("ImplementationGuide.contact.telecom.system", "url")
            end
            it ".telecom.value has value 'https://github.com/robeastwood-agency'" do
                expect(@file).to have_element_with_value("ImplementationGuide.contact.telecom.value", "https://github.com/robeastwood-agency")
            end
            it ".telecom.use is not present" do
                expect(@file).not_to have_element("ImplementationGuide.contact.telecom.use")
            end
            it ".telecom.rank is not present" do
                expect(@file).not_to have_element("ImplementationGuide.contact.telecom.rank")
            end
            it ".telecom.period is not present" do
                expect(@file).not_to have_element("ImplementationGuide.contact.telecom.period")
            end
        end

        context 'ImplementationGuide.description' do        
            it "is present" do
                expect(@file).to have_element("ImplementationGuide.description")
            end
        end

        context 'ImplementationGuide.useContext' do        
            it "is not present" do
                expect(@file).not_to have_element("ImplementationGuide.useContext")
            end
        end

        context "ImplementationGuide.jurisdiction" do
            it "is present once" do
                expect(@file).to have_one_of_node("ImplementationGuide.jurisdiction")
            end
            it ".coding is present once" do
                expect(@file).to have_one_of_node("ImplementationGuide.jurisdiction.coding")
            end
            it ".coding.system has value 'urn:iso:std:iso:3166'" do
                expect(@file).to have_element_with_value("ImplementationGuide.jurisdiction.coding.system","urn:iso:std:iso:3166")
            end
            it ".coding.version is not present" do
                expect(@file).not_to have_element("ImplementationGuide.jurisdiction.coding.version")
            end
            it ".coding.code has value 'AU'" do
                expect(@file).to have_element_with_value("ImplementationGuide.jurisdiction.coding.code","AU")
            end
            it ".coding.display is not present" do
                expect(@file).not_to have_element("ImplementationGuide.jurisdiction.coding.display")
            end
            it ".coding.userSelected is not present" do
                expect(@file).not_to have_element("ImplementationGuide.jurisdiction.coding.userSelected")
            end
        end

        context 'ImplementationGuide.purpose' do        
            it "is not present" do
                expect(@file).not_to have_element("ImplementationGuide.purpose")
            end
        end

        context 'ImplementationGuide.copyright' do        
            it "is not present" do
                expect(@file).not_to have_element("ImplementationGuide.copyright")
            end
        end

        context 'ImplementationGuide.copyrightLabel' do        
            it "is not present" do
                expect(@file).not_to have_element("ImplementationGuide.copyrightLabel")
            end
        end

        context 'ImplementationGuide.packageId' do        
            it "has value 'fhir.ig.experiment.01'" do
                expect(@file).to have_element_with_value("ImplementationGuide.packageId", "fhir.ig.experiment.01")
            end
        end

        context 'ImplementationGuide.license' do        
            it "has value 'CC0-1.0'" do
                expect(@file).to have_element_with_value("ImplementationGuide.license", "CC0-1.0")
            end
        end

        context 'ImplementationGuide.fhirVersion' do        
            it "has value '4.0.1'" do
                expect(@file).to have_element_with_value("ImplementationGuide.fhirVersion", "4.0.1")
            end
        end

        context 'ImplementationGuide.dependsOn' do        
            it "is not present" do
                expect(@file).not_to have_element("ImplementationGuide.dependsOn")
            end
        end

        context 'ImplementationGuide.global' do        
            it "is not present" do
                expect(@file).not_to have_element("ImplementationGuide.global")
            end
        end

    end

    context '2) grouping' do
    
        context 'definition.grouping' do      
            it "is not present" do
                expect(@file).not_to have_element("ImplementationGuide.definition.grouping")
            end
        end
    end

    context '3) resources:' do
        context 'definition.resource' do
            it "is something..."
        end
    end

    context '4) pages:' do

        context 'ImplementationGuide.definition.page.nameUrl' do
            it "has value 'toc.html'" do
                expect(@file).to have_element_with_value("ImplementationGuide.definition.page.nameUrl", "toc.html")
            end
        end

        context 'ImplementationGuide.definition.page.title' do
            it "has value 'Table of Contents'" do
                expect(@file).to have_element_with_value("ImplementationGuide.definition.page.title", "Table of Contents")
            end
        end

        context 'ImplementationGuide.definition.page.generation' do
            it "has value 'html'" do
                expect(@file).to have_element_with_value("ImplementationGuide.definition.page.generation", "html")
            end
        end

    end

    context '5) parameters:' do

        context "parameter: 'copyrightyear'" do
            it "is present with value '2020+'" do
                param_code = "copyrightyear"
                param_value = "2020+"
                expect(@file).to have_parameter_with_code_and_value(param_code,param_value)
            end
        end

        context "parameter: 'releaselabel'" do
            it "is present with value 'CI Build'" do
                param_code = "releaselabel"
                param_value = "CI Build"
                expect(@file).to have_parameter_with_code_and_value(param_code,param_value)
            end
        end

        context "parameter: 'path-resource'" do
            it "is present with value 'input/resources'" do
                param_code = "path-resource"
                param_value = "input/resources"
                expect(@file).to have_parameter_with_code_and_value(param_code,param_value)
            end
        end

        context "parameter: 'path-resource'" do
            it "is present with value 'input/resources/StructureDefinition/'" do
                param_code = "path-resource"
                param_value = "input/resources/StructureDefinition/"
                expect(@file).to have_parameter_with_code_and_value(param_code,param_value)
            end
        end

        context "parameter: 'excludettl'" do
            it "is present with value 'true'" do
                param_code = "excludettl"
                param_value = "true"
                expect(@file).to have_parameter_with_code_and_value(param_code,param_value)
            end
        end

        context "parameter: 'excludemap'" do
            it "is present with value 'true'" do
                param_code = "excludemap"
                param_value = "true"
                expect(@file).to have_parameter_with_code_and_value(param_code,param_value)
            end
        end

    end

end 