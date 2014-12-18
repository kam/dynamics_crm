module DynamicsCRM
  module Metadata
    # Represents OneToManyRelationshipMetadata XML fragment.
    class OneToManyRelationship < XmlDocument

      attr_reader :entity

      def initialize(entity, xml_fragment)
        super(xml_fragment)
        @entity = entity
      end

      def link_entity(attributes=[])
        from_object = self.ReferencedEntity
        from_attribute = self.ReferencedAttribute
        to_attribute = self.ReferencingAttribute
        to_object = self.ReferencingEntity
        attributes = ["address1_composite", "address1_city"]

        attribute_xml = attributes.map {|a| %Q{  <attribute name="#{a}" />} }.join("\n")
%Q{
<link-entity name="#{from_object}" from="#{from_attribute}" to="#{to_attribute}" alias="#{from_object}">
#{attribute_xml}
</link-entity>
}
      end
    end

    # Represents ManyToManyRelationshipMetadata XML fragment.
    class ManyToManyRelationship < OneToManyRelationship; end

  end
end
