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

    context 'metadata:' do

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
            it "has value '0.0.1'" do
                expect(@file).to have_element_with_value("ImplementationGuide.version", "0.0.1")
            end
            it 'conforms to SemVer rules'
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

        context "contact" do
            it "is present once" do
                expect(@file).to have_one_of_node("ImplementationGuide.contact")
            end
            it "contact.name is not present" do
                expect(@file).not_to have_element("ImplementationGuide.contact.name")
            end
            it "contact.telecom is present once" do
                expect(@file).to have_one_of_node("ImplementationGuide.contact.telecom")
            end
            it "* contact.telecom.system has value 'url'" do
                expect(@file).to have_element_with_value("ImplementationGuide.contact.telecom.system", "url")
            end
            it "* contact.telecom.value has value 'https://github.com/robeastwood-agency'" do
                expect(@file).to have_element_with_value("ImplementationGuide.contact.telecom.value", "https://github.com/robeastwood-agency")
            end
            it "contact.telecom.use is not present" do
                expect(@file).not_to have_element("ImplementationGuide.contact.telecom.use")
            end
            it "contact.telecom.rank is not present" do
                expect(@file).not_to have_element("ImplementationGuide.contact.telecom.rank")
            end
            it "contact.telecom.period is not present" do
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

        context "jurisdiction" do
            it "is present once" do
                expect(@file).to have_one_of_node("ImplementationGuide.jurisdiction")
            end
            it "jurisdiction.coding is present once" do
                expect(@file).to have_one_of_node("ImplementationGuide.jurisdiction.coding")
            end
            it "jurisdiction.coding.system has value 'urn:iso:std:iso:3166'" do
                expect(@file).to have_element_with_value("ImplementationGuide.jurisdiction.coding.system","urn:iso:std:iso:3166")
            end
            it "jurisdiction.coding.version is not present" do
                expect(@file).not_to have_element("ImplementationGuide.jurisdiction.coding.version")
            end
            it "jurisdiction.coding.code has value 'AU'" do
                expect(@file).to have_element_with_value("ImplementationGuide.jurisdiction.coding.code","AU")
            end
            it "jurisdiction.coding.display is not present" do
                expect(@file).not_to have_element("ImplementationGuide.jurisdiction.coding.display")
            end
            it "jurisdiction.coding.userSelected is not present" do
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

    context 'definition.grouping' do
      
        it "is not present" do
            expect(@file).not_to have_element("ImplementationGuide.definition.grouping")
        end

    end

    context 'definition.resource' do
      
        it "is something..." 

    end

    context 'definition.page' do
      
        it "is something..." 
        
    end

    context 'definition.parameter' do
      
        it "is something..." 
        
    end

end